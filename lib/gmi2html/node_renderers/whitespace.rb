# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Whitespace < Base
      def to_s
        "<br />\n"
      end
    end
  end
end
