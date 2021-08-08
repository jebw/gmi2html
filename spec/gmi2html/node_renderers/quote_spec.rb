# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Quote do
  let(:instance) { described_class.new Gemtext::Quote.new('Quote') }

  describe '#to_s' do
    subject { instance.to_s }

    it { is_expected.to eq "<blockquote>Quote</blockquote>\n" }
  end
end