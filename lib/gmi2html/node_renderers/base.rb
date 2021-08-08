# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class NotGemtextNode < RuntimeError
      def initialize
        super 'Supplied object does not inherit from Gemtext::Node'
      end
    end

    class Base
      class << self
        def for_gemtext(gemtext_node)
          klass_for_gemtext_node(gemtext_node).new gemtext_node
        end

        private

        def klass_for_gemtext_node(node)
          raise NotGemtextNode unless node.is_a? Gemtext::Node

          node_type = node.class.to_s.split('::').last
          Gmi2html::NodeRenderers.const_get node_type
        end
      end

      def initialize(node)
        @node = node
      end

      def render(_prev_node = nil, _next_node = nil)
        "<#{tag}>#{escaped_content}</#{tag}>\n"
      end

      def to_s
        render
      end

      def content
        @node.content
      end

      def escaped_content
        content # FIXME: actually escape content
      end
    end
  end
end
