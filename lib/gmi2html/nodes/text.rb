# frozen_string_literal: true

module Gmi2html
  module Nodes
    class Text < Gmi2html::Node
      def tag
        'p'
      end
    end
  end
end
