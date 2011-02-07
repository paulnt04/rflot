class RFlot
  # The version of the rflot ibrary.
  VERSION = '0.1a'

  # This is the graph data. It can be an array, hash, or JSON.
  attr_accessor :data

  # This attribute sets the graph type

  attr_accessor :graph_type
  
  # This attribute depends on graph_type
  
  attr_accessor :graph_options
  
  # Failures and warnings
  attr_reader :exception
  attr_reader :warning


  def initialize(graph_type=nil, data=nil, graph_options={})
     @graph_type      = graph_type
     @graph_options      = graph_options
     @data   = data
     @exception = nil
     @warning   = nil
     
     yield self if block_given?
  end
  
  # The default instance of RFlot#graph is able to call its children via graph_type
  
  def graph(host = @host)
     raise ArgumentError, 'no type specified' unless graph_type
     raise ArgumentError, 'no data specified' unless data
     @exception = nil
     @warning   = nil
     
     if graph_type
       child = "RFlot::" + graph_type.capitalize
       # Constantize (is defined as to not require rails method constantize)
       names = child.split('::')
       names.shift if names.empty? || names.first.empty?
       constant = Object
       names.each do |name|
         constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
       end
       # End Constantize
       child_class = constant.new(graph_type)
       child_class.data = data
       return child_class.graph
     end
  end
  
  # Javascript tags takes list of tags to include
  def javascript_include_tags(*tags)
    return_html = %[<script language="text" type="text/javascript" src="javascripts/jquery.flot.js"></script>\n]
    if @graph_type =~ /pie/i
      return_html<<%[<script language="text" type="text/javascript" src="javascripts/jquery.flot.pie.js"></script>\n]
    end
    if tags
      return_tags = ""
      tags.each do |tag|
        if tag =~ /jquery.flot.*js/
          js_lib = tag
        elsif tag =~ /(crosshair|fillbetween|image|navigate|pie|resize|selection|stack|symbol|threshold)/
          js_lib = "jquery.flot.#{tag}.js"
        end
        return_tags<<%[<script language="text" type="text/javascript" src="javascripts/#{js_lib}"></script>\n]
      end
      return_html<<return_tags
    end 
    return return_html
  end
  
  alias plot graph
  alias js_tags javascript_include_tags
end