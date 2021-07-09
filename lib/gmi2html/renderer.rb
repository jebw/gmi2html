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

        html_node_for_gemtext_node(node)
      end
    end

    def html_node_for_gemtext_node(node)
      klass_for_gemtext_node(node).new node
    end

    def klass_for_gemtext_node(node)
      Nodes.const_get node.class.to_s.gsub(/\AGemtext::/, '')
    end

    def first_whitespace_node?(index)
      index >= 0 && whitespace_node?(index) && !whitespace_node?(index - 1)
    end

    def whitespace_node?(index)
      @gemtext_nodes[index].is_a? Gemtext::Whitespace
    end
  end
end
