# frozen_string_literal: true

module Gmi2html
  module Nodes
    class SubSubHeading < Gmi2html::Node
      def tag
        'h3'
      end
    end
  end
end
