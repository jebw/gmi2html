# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Preformatted < Base
      def tag
        'pre'
      end

      def escaped_link
        CGI.escapeHTML(@node.target)
      end

      def escaped_alt_text
        CGI.escapeHTML(@node.caption)
      end

      def escaped_code
        return escaped_content unless @node.caption

        %(<code class="language-#{escaped_alt_text}">#{escaped_content}</code>)
      end

      def render(_prev_node = nil, _next_node = nil)
        %(<#{tag}>#{escaped_code}</#{tag}>\n)
      end
    end
  end
end
