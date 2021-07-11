# frozen_string_literal: true

module Gmi2html
  class NotGemtextNode < RuntimeError
    def initialize
      super 'Supplied object does not inherit from Gemtext::Node'
    end
  end

  class Node
    attr_reader :content

    class << self
      def for_gemtext(gemtext_node)
        klass_for_gemtext_node(gemtext_node).new gemtext_node.content
      end

      private

      def klass_for_gemtext_node(node)
        raise NotGemtextNode unless node.is_a? Gemtext::Node

        Nodes.const_get node.class.to_s.split('::').last
      end
    end

    def initialize(content)
      @content = content
    end

    def to_s
      "<#{tag}>#{escaped_content}</#{tag}>\n"
    end

    private

    def escaped_content
      content # FIXME: actually escape content
    end
  end
end
