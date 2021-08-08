# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class SubHeading < Base
      def tag
        'h2'
      end
    end
  end
end
