# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::Document do
  describe '#new' do
    context 'with gemini content' do
      subject { described_class.new "# Title\n\nBody content" }

      it { is_expected.to be_instance_of described_class }
    end

    context 'without gemini content' do
      let(:instance) { described_class.new }

      it { expect { instance }.to raise_exception ArgumentError }
    end
  end

  describe '#from_file' do
    context 'with valid file' do
      subject { described_class.from_file fixture_file 'simple' }

      it { is_expected.to be_instance_of described_class }
    end

    context 'with missing file' do
      let(:instance) { described_class.from_file fixture_file 'unknown' }

      it { expect { instance }.to raise_exception Errno::ENOENT }
    end

    context 'without file' do
      let(:instance) { described_class.from_file }

      it { expect { instance }.to raise_exception ArgumentError }
    end
  end

  describe '#to_html' do
    subject { instance.to_html }

    let(:instance) { described_class.from_file gemini_file }
    let(:html_file) { gemini_file.gsub(/\.gmi\z/, '.html') }

    all_gmi_fixtures.each do |gemini_file|
      context "with #{File.basename gemini_file}" do
        let(:gemini_file) { gemini_file }

        it { is_expected.to eql html_file }
      end
    end
  end

  describe '#to_html_file' do
    it 'will be written'
  end
end
