# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Base do
  let :test_node do
    Class.new(described_class) do
      def tag
        'test'
      end
    end
  end

  describe '.for_gemtext' do
    let(:gemtext) { Gemtext::Text.new 'Gemtext test' }
    let(:instance) { described_class.for_gemtext gemtext }

    it 'will return a Gmi2html::NodeRenderers::Text' do
      expect(instance).to be_kind_of Gmi2html::NodeRenderers::Text
    end

    it 'will assign the content' do
      expect(instance.content).to eq gemtext.content
    end
  end

  describe '#to_s' do
    let(:content) { 'Hello, world!' }
    let(:instance) { test_node.new content }

    it 'will generate a <test> html element' do
      expect(instance.to_s).to match %r{\A<test>[^<]+</test>}
    end

    it 'will include the content' do
      expect(instance.to_s).to match %r{>Hello, world!<}
    end

    it 'will end with a newline' do
      expect(instance.to_s).to match %r{</test>\n\z}
    end

    it 'will escape the content'
  end
end
