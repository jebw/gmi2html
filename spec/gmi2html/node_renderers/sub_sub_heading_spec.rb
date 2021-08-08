# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::SubSubHeading do
  let(:instance) { described_class.new Gemtext::SubSubHeading.new('Heading 3') }

  describe '#render' do
    subject { instance.render }

    it { is_expected.to eq "<h3>Heading 3</h3>\n" }
  end
end
