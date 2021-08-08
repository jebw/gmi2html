# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::Renderer do
  subject(:renderer) { described_class.new(nodes) }

  let(:node) { Gemtext::Text.new('Hello, world!') }
  let(:heading) { Gemtext::Heading.new('Heading') }
  let(:heading_renderer) { Gmi2html::NodeRenderers::Heading.new(heading) }
  let(:nodes) { [heading, node, node] }

  describe '#to_html' do
    subject(:rendered) { renderer.to_html }

    before do
      allow(Gmi2html::NodeRenderers::Base).to \
        receive(:for_gemtext).and_call_original

      allow(Gmi2html::NodeRenderers::Base).to \
        receive(:for_gemtext).with(heading).and_return(heading_renderer)
    end

    it 'will combine the nodes' do
      expect(rendered).to eql \
        "<h1>Heading</h1>\n<p>Hello, world!</p>\n<p>Hello, world!</p>\n"
    end

    context 'with nodes which render a nil response' do
      before { allow(heading_renderer).to receive(:render).and_return(nil) }

      it 'will skip those nodes' do
        expect(rendered).to eql("<p>Hello, world!</p>\n<p>Hello, world!</p>\n")
      end
    end

    context 'with multiple nodes' do
      let(:nodes) { [node, heading, node] }

      before { allow(heading_renderer).to receive(:render).and_call_original }

      it 'will pass surrounding nodes for context into NodeRenderer#render' do
        renderer.to_html
        expect(heading_renderer).to have_received(:render).with(node, node)
      end
    end
  end
end
