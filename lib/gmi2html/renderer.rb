# frozen_string_literal: true

module Gmi2html
  class Renderer
    attr_reader :nodes

    def initialize(nodes)
      @nodes = nodes
    end

    def to_html
      rendered_nodes.compact.join
    end

    private

    def rendered_nodes
      nodes.map.with_index do |node, index|
        prev_node = index >= 0 ? nodes[index - 1] : nil
        next_node = nodes[index]

        node_renderer = NodeRenderers::Base.for_gemtext(node)
        node_renderer.render(prev_node, next_node)
      end
    end
  end
end
