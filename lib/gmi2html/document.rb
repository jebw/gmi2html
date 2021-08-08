# frozen_string_literal: true

require 'gemtext'

module Gmi2html
  class Document
    def initialize(doc)
      @document_io = wrap_document(doc)
      @gemtext = parse_gemtext
    end

    def to_html
      renderer.to_html
    end

    private

    def wrap_document(doc)
      doc.is_a?(String) ? StringIO.new(doc) : doc
    end

    def parse_gemtext
      ::Gemtext::Parser.new(@document_io).parse
    end

    def renderer
      Renderer.new @gemtext.nodes
    end
  end
end
