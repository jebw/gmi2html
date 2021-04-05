# frozen_string_literal: true

module Gmi2html
  class Node
    def initialize(content)
      @content = content
    end

    def to_s
      "<#{tag}>#{escaped_content}</#{tag}>"
    end

    private

    def escaped_content
      @content # FIXME: actually escape content
    end
  end
end
