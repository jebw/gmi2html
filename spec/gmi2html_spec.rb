# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html do
  describe 'VERSION' do
    subject { described_class::VERSION }

    it { is_expected.to eql '0.1.0' }
  end
end
