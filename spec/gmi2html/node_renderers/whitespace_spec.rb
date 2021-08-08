# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Whitespace do
  let(:instance) { described_class.new 'ignore' }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<br />\n" }
  end
end
