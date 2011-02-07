require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rflot','0.1a') do |doc|
  doc.description     = "Generate dynamic graphs in a Ruby-on-Rails application"
  doc.url             = "http://github.com/paulnt04/rflot"
  doc.author          = "Paul Panarese"
  doc.email           = "git@panjunction.com"
  doc.ignore_pattern  = ["tmp/*","script/*"]
  doc.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }