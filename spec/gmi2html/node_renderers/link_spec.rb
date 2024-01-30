# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Link do
  let(:instance) { described_class.new link }

  describe '#render' do
    subject(:rendered) { instance.render(prev_node, next_node) }

    let(:other_node) { Gemtext::Node.new('Hello, world!') }
    let(:link) { Gemtext::Link.new '/my-capsule my capsule' }

    context 'when only link' do
      let(:prev_node) { nil }
      let(:next_node) { nil }

      it 'will render opening and closing p tags in addition to the a tag' do
        expect(rendered).to eql \
          %(<p>\n<a href="/my-capsule">my capsule</a>\n</p>\n)
      end
    end

    context 'when first link' do
      let(:prev_node) { other_node }
      let(:next_node) { link }

      it 'will render opening p tag as well as a tag' do
        expect(rendered).to eql \
          %(<p>\n<a href="/my-capsule">my capsule</a>\n)
      end
    end

    context 'when last link' do
      let(:prev_node) { link }
      let(:next_node) { nil }

      it 'will render a tag plus closing p tag' do
        expect(rendered).to eql \
          %(<a href="/my-capsule">my capsule</a>\n</p>\n)
      end
    end

    context 'when in the middle of a collection of links' do
      let(:prev_node) { link }
      let(:next_node) { link }

      it 'will render only the a tag' do
        expect(rendered).to eql \
          %(<a href="/my-capsule">my capsule</a>\n)
      end
    end
  end
end
