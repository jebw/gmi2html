# frozen_string_literal: true

module Gmi2html
  class Document
    class << self
      def from_file(filename)
        new File.read(filename)
      end
    end

    def initialize(gemini_content)
      @gemini_content = gemini_content
    end

    def to_html
      @gemini_content
    end
  end
end
