# frozen_string_literal: true

module Gmi2html
  module Nodes
    class Heading < Gmi2html::Node
      def tag
        'h1'
      end
    end
  end
end
