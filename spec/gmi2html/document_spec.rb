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

    let(:instance) { described_class.new File.read(gemini_file) }
    let(:html_file) { gemini_file.gsub(/\.gmi\z/, '.html') }

    all_gmi_fixtures.each do |gemini_file|
      context "with #{File.basename gemini_file}" do
        let(:gemini_file) { gemini_file }

        it { is_expected.to eql File.read(html_file) }
      end
    end
  end
end
