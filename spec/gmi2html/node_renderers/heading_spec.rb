# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Heading do
  let(:instance) { described_class.new Gemtext::Heading.new('Heading') }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<h1>Heading</h1>\n" }
  end
end
