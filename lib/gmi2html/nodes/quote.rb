# frozen_string_literal: true

module Gmi2html
  module Nodes
    class Quote < Gmi2html::Node
      def tag
        'blockquote'
      end
    end
  end
end
