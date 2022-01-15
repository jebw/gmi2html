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

      def render(prev_node = nil, next_node = nil)
        prefix = prev_node.is_a?(Gemtext::Link) ? '' : "<#{wrapping_tag}>\n"
        suffix = next_node.is_a?(Gemtext::Link) ? '' : "</#{wrapping_tag}>\n"

        "#{prefix}#{rendered_link_tag}#{suffix}"
      end
    end
  end
end
