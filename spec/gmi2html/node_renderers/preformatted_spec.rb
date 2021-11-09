# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gmi2html::NodeRenderers::Preformatted do
  let(:instance) { described_class.new preformatted }
  let(:preformatted) { Gemtext::Preformatted.new("Some text\n\n\tIndented") }

  describe '#render' do
    subject(:rendered) { instance.render }

    it { is_expected.to eq "<pre>Some text\n\n\tIndented</pre>\n" }

    context 'with a specified language' do
      let(:preformatted) { Gemtext::Preformatted.new('puts "Hello matz"', 'ruby') }

      it 'includes the language class' do
        expect(rendered).to eq \
          %(<pre><code class="language-ruby">puts &quot;Hello matz&quot;</code></pre>\n)
      end
    end
  end
end
