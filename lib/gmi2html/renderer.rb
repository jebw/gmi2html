# frozen_string_literal: true

module Gmi2html
  class Renderer
    def initialize(nodes)
      @gemtext_nodes = nodes
    end

    def to_html
      html_nodes.compact.join
    end

    private

    def html_nodes
      @gemtext_nodes.map.with_index do |node, index|
        next if first_whitespace_node? index

        Node.for_gemtext node
      end
    end

    def first_whitespace_node?(index)
      index >= 0 && whitespace_node?(index) && !whitespace_node?(index - 1)
    end

    def whitespace_node?(index)
      @gemtext_nodes[index].is_a? Gemtext::Whitespace
    end
  end
end
