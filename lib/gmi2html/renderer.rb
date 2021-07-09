# frozen_string_literal: true

module Gmi2html
  class Renderer
    def initialize(nodes)
      @nodes = nodes
    end

    def to_html
      html_nodes.compact.join
    end

    private

    def html_nodes
      @nodes.map.with_index do |node, index|
        # next if first_whitespace_node? index

        klass = html_node_for_gemtext_node(node)
        klass.new node.content
      end
    end

    def html_node_for_gemtext_node(node)
      node_name = node.class.to_s.gsub(/\AGemtext::/, '')
      Nodes.const_get node_name
    end

    # This belongs in the node renderer - will need to know about earlier nodes somehow
    # def first_whitespace_node?(index)
    #   index >= 0 && whitespace_node?(index) && !whitespace_node?(index - 1)
    # end

    # This belongs in the node renderer
    # def whitespace_node?(index)
    #   gemtext_nodes[index].is_a? Gemtext::Whitespace
    # end
  end
end
