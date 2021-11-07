# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::ListItem do
  let(:instance) { described_class.new list_item }

  describe '#render' do
    subject(:rendered) { instance.render(prev_node, next_node) }

    let(:other_node) { Gemtext::Node.new('Hello, world!') }
    let(:list_item) { Gemtext::ListItem.new 'first item' }

    context 'when only list item' do
      let(:prev_node) { other_node }
      let(:next_node) { other_node }

      it 'will render opening and closing ul tags in addition to the li tags' do
        expect(rendered).to eql "<ul>\n<li>first item</li>\n</ul>\n"
      end
    end

    context 'when first list item' do
      let(:prev_node) { other_node }
      let(:next_node) { list_item }

      it 'will render opening ul tag as well as li tags' do
        expect(rendered).to eql "<ul>\n<li>first item</li>\n"
      end
    end

    context 'when last list item' do
      let(:prev_node) { list_item }
      let(:next_node) { nil }

      it 'will render li tags plus closing ul tag' do
        expect(rendered).to eql "<li>first item</li>\n</ul>\n"
      end
    end

    context 'when in the middle of list items' do
      let(:prev_node) { list_item }
      let(:next_node) { list_item }

      it 'will render only the li tags' do
        expect(rendered).to eql "<li>first item</li>\n"
      end
    end
  end
end
