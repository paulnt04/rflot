# By doing a "require 'net/ping'" you are requiring every subclass.  If you
# want to require a specific ping type only, do "require 'net/ping/tcp'",
# for example.
#
require 'rbconfig'

require File.join(File.dirname(__FILE__), 'rflot/line')
require File.join(File.dirname(__FILE__), 'rflot/point')
require File.join(File.dirname(__FILE__), 'rflot/area')
require File.join(File.dirname(__FILE__), 'rflot/bar')
require File.join(File.dirname(__FILE__), 'rflot/pie')