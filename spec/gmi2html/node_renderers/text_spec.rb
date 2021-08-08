# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Text do
  let(:instance) { described_class.new 'Hello' }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<p>Hello</p>\n" }
  end
end
