# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Heading < Base
      def tag
        'h1'
      end
    end
  end
end
