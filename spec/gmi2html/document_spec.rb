# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::Document do
  describe '#new' do
    context 'with open file' do
      subject { described_class.new StringIO.new("# Title\n\nBody content") }

      it { is_expected.to be_instance_of described_class }
    end

    context 'with gemini content' do
      subject { described_class.new "# Title\n\nBody content" }

      it { is_expected.to be_instance_of described_class }
    end

    context 'without gemini content' do
      let(:instance) { described_class.new }

      it { expect { instance }.to raise_exception ArgumentError }
    end
  end

  describe '#to_html' do
    subject { instance.to_html }

    let(:instance) { described_class.new File.read(gemtext_file) }

    shared_examples 'a converted gemtext file' do |filename|
      let(:gemtext_file) { "spec/fixtures/#{filename}.gmi" }
      let(:expected_html_output) { File.read "spec/fixtures/#{filename}.html" }

      it { is_expected.to eql expected_html_output }
    end

    it_behaves_like 'a converted gemtext file', 'simple'
    it_behaves_like 'a converted gemtext file', 'complex'
  end
end
