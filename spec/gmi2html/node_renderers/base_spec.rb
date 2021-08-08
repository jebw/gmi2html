# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Base do
  let(:content) { 'Hello, world!' }
  let(:instance) { test_node_renderer.new Gemtext::Node.new(content) }

  let :test_node_renderer do
    Class.new(described_class) do
      def tag
        'test'
      end
    end
  end

  describe '.for_gemtext' do
    let(:node) { Gemtext::Text.new content }
    let(:instance) { described_class.for_gemtext node }

    it 'will return a Gmi2html::NodeRenderers::Text' do
      expect(instance).to be_kind_of Gmi2html::NodeRenderers::Text
    end

    it 'will assign the content' do
      expect(instance.content).to eq node.content
    end
  end

  describe '#render' do
    it 'will generate a <test> html element' do
      expect(instance.render).to match %r{\A<test>[^<]+</test>}
    end

    it 'will include the content' do
      expect(instance.render).to match %r{>Hello, world!<}
    end

    it 'will end with a newline' do
      expect(instance.render).to match %r{</test>\n\z}
    end

    context 'with html tags in' do
      let(:content) { '<p>Hello</p>' }

      it 'will escape the content' do
        expect(instance.render).to eql "<test>&lt;p&gt;Hello&lt;/p&gt;</test>\n"
      end
    end

    context 'with html special chars' do
      let(:content) { 'Hello & world' }

      it 'will escape the content' do
        expect(instance.render).to eql "<test>Hello &amp; world</test>\n"
      end
    end
  end

  describe '#to_s' do
    it 'will generate a <test> html element' do
      expect(instance.render).to match %r{\A<test>[^<]+</test>}
    end
  end
end
