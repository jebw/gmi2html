# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Link < Base
      def tag
        'a'
      end

      def wrapping_tag
        'p'
      end

      def escaped_link
        CGI.escapeHTML(@node.target)
      end

      def escaped_description
        CGI.escapeHTML(@node.description)
      end

      def rendered_link_tag
        %(<#{tag} href="#{escaped_link}">#{escaped_description}</#{tag}>\n)
      end

      def render(_prev_node = nil, _next_node = nil)
        prefix = "<#{wrapping_tag}>\n"
        suffix = "</#{wrapping_tag}>\n"

        "#{prefix}#{rendered_link_tag}#{suffix}"
      end
    end
  end
end
