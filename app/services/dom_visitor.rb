class DomVisitor
  attr_accessor :html

  def initialize
    @html = ''
    @color = 0
    @lvl = 0
  end

  def visit node
    if node.try(:name)
      @html += "<span class='#{node.name}' style='color: #{color};'>\n"
      @color += 1
      if node.elements
        node.elements.each do |node|
          visit node
        end
      end
      @html += "\n</span>"
    else
      if node.elements
        node.elements.each do |node|
          visit node
        end
      else
        @html += node.text_value
      end
    end
  end

  def color
    color_arr = ['#67597e', '#ae767f', '#b8a87d']
    index = @color % 3
    color_arr[index]
  end
end
