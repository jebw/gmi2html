# frozen_string_literal: true

module Gmi2html
  module Nodes
    class Whitespace < Gmi2html::Node
      def to_s
        '<br />'
      end
    end
  end
end
