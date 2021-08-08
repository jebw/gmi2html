# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Whitespace < Base
      def render
        "<br />\n"
      end
    end
  end
end
