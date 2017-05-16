class HomeController < ApplicationController
  def index
    if params[:data]
      tree = Parser.parse params[:data]
      visitor =  DomVisitor.new
      visitor.visit tree
      @convert =  visitor.html
    end
  end
end
