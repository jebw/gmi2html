# frozen_string_literal: true

module Gmi2html
  module Nodes
    class SubHeading < Gmi2html::Node
      def tag
        'h2'
      end
    end
  end
end
