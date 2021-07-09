# frozen_string_literal: true

module Gmi2html
  class Node
    def initialize(gemtext_node)
      @gemtext_node = gemtext_node
    end

    def to_s
      "<#{tag}>#{escaped_content}</#{tag}>\n"
    end

    private

    def content
      @gemtext_node.content
    end

    def escaped_content
      content # FIXME: actually escape content
    end
  end
end
