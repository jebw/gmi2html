# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::Nodes::Heading do
  let(:instance) { described_class.new 'Heading' }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<h1>Heading</h1>\n" }
  end
end
