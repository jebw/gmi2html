# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Text < Base
      def tag
        'p'
      end
    end
  end
end
