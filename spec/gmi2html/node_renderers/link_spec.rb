# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Link do
  let(:instance) { described_class.new link }

  describe '#render' do
    subject(:rendered) { instance.render }

    let(:link) { Gemtext::Link.new '/my-capsule my capsule' }

    context 'when only list item' do
      it 'will render opening and closing p tags in addition to the a tag' do
        expect(rendered).to eql \
          %(<p>\n<a href="/my-capsule">my capsule</a>\n</p>\n)
      end
    end
  end
end
