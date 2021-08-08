# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::SubHeading do
  let(:instance) { described_class.new Gemtext::SubHeading.new('Heading 2') }

  describe '#render' do
    subject { instance.render }

    it { is_expected.to eq "<h2>Heading 2</h2>\n" }
  end
end
