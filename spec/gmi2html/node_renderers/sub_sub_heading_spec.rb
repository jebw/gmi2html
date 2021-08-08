# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::SubSubHeading do
  let(:instance) { described_class.new 'Heading 3' }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<h3>Heading 3</h3>\n" }
  end
end
