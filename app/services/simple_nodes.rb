module Simple
  class BaseNode < Treetop::Runtime::SyntaxNode
    def name
      :custom
    end
  end

  class Document < BaseNode
    def name
      :root
    end
  end

  class LineLiteral < BaseNode
    def name
      :line
    end
  end

  class TextLiteral < BaseNode
    def name
      :text
    end
  end

  class NumberLiteral < BaseNode
    def name
      :number
    end
  end
end
