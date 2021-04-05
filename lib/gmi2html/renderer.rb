# frozen_string_literal: true

module Gmi2html
  class Renderer
    def initialize(gemtext_document)
      @gemtext_document = gemtext_document
    end

    def to_html
      html_nodes.join("\n")
    end

    private

    def html_nodes
      @gemtext_document.nodes.map do |node|
        klass = html_node_for_gemtext_node(node)
        klass.new node.content
      end
    end

    def html_node_for_gemtext_node(node)
      node_name = node.class.to_s.gsub(/\AGemtext::/, '')
      Nodes.const_get node_name
    end
  end
end
