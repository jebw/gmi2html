# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Whitespace do
  let(:instance) { described_class.new Gemtext::Whitespace.new }

  describe '#render' do
    subject { instance.render }

    it { is_expected.to eq "<br />\n" }
  end
end
