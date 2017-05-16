require File.expand_path('../simple_nodes.rb', __FILE__)

class Parser
  Treetop.load(File.expand_path('../simple.treetop', __FILE__))
  @parser = SimpleParser.new

  def self.parse template
    tree = @parser.parse template
    raise Parser::TemplateError, "Parser error at offset: #{@parser.index} failure reason: #{@parser.failure_reason}" if tree.nil?
    tree
  rescue Parser::TemplateError => e
    [nil, e.message]
  end
end
class Parser::TemplateError < StandardError; end

