# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Text do
  let(:instance) { described_class.new Gemtext::Text.new('Hello') }

  describe '#render' do
    subject { instance.render }

    it { is_expected.to eq "<p>Hello</p>\n" }
  end
end
