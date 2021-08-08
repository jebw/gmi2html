# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Whitespace do
  let(:instance) { described_class.new Gemtext::Whitespace.new }

  describe '#render' do
    subject { instance.render }

    let(:other_node) { Gemtext::Node.new('Hello, world!') }
    let(:whitespace_node) { Gemtext::Whitespace.new }

    it { is_expected.to eq "<br />\n" }

    context 'when first node in document' do
      subject { instance.render(nil, other_node) }

      it('will render a break tag') { is_expected.to eq "<br />\n" }
    end

    context 'when first node in sequence of whitespace nodes' do
      subject { instance.render(other_node, whitespace_node) }

      it('will not render a break tag') { is_expected.to be_nil }
    end

    context 'when later node in sequence of whitespace nodes' do
      subject { instance.render(whitespace_node, other_node) }

      it('will render a break tag') { is_expected.to eq "<br />\n" }
    end
  end
end
