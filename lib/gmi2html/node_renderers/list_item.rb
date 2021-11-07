# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class ListItem < Base
      def tag
        'li'
      end

      def wrapping_tag
        'ul'
      end

      def render(prev_node = nil, next_node = nil)
        prefix = prev_node.is_a?(Gemtext::ListItem) ? '' : "<#{wrapping_tag}>\n"
        suffix = next_node.is_a?(Gemtext::ListItem) ? '' : "</#{wrapping_tag}>\n"

        "#{prefix}#{super}#{suffix}"
      end
    end
  end
end
