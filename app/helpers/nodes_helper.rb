# app/helpers/nodes_helper.rb

module NodesHelper
    def arrow_indicator(node)
      node.children.any? ? content_tag(:span, '▶', class: 'arrow') : ''
    end
  end
  