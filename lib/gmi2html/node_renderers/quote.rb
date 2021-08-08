# frozen_string_literal: true

module Gmi2html
  module NodeRenderers
    class Quote < Base
      def tag
        'blockquote'
      end
    end
  end
end
