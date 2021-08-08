# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Whitespace < Base
      def render(prev_node = nil, _next_node = nil)
        # Skip the first whitespace node except at start of document
        return if prev_node && !prev_node.is_a?(Gemtext::Whitespace)

        "<br />\n"
      end
    end
  end
end
