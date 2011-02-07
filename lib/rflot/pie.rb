require File.join(File.dirname(__FILE__), 'rflot')

class RFlot::Pie < RFlot
    
  def initialize(data=nil, graph_options={})
     @graph_type      = "pie"
     @graph_options      = graph_options
     @data   = data
     @exception = nil
     @warning   = nil
     
     yield self if block_given?
  end
    
  def graph
    return "This is a line graph"
  end
    
end
