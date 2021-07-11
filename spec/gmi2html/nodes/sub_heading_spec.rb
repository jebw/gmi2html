# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::Nodes::SubHeading do
  let(:instance) { described_class.new 'Heading 2' }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<h2>Heading 2</h2>\n" }
  end
end
