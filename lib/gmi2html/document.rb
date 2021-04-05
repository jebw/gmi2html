# frozen_string_literal: true

require 'gemtext'

module Gmi2html
  class Document
    class << self
      def from_file(filename)
        File.open(filename) do |file|
          new file
        end
      end
    end

    def initialize(document_io)
      document_io = StringIO.new(document_io) if document_io.is_a?(String)

      @document_io = document_io
      @document = document
    end

    def to_html
      renderer.to_html
    end

    private

    def parser
      ::Gemtext::Parser.new @document_io
    end

    def document
      parser.parse
    end

    def renderer
      Renderer.new @document
    end
  end
end
