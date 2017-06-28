require File.expand_path('../../config/environment', __FILE__)
co = CheckOut.new
co.scan("A")
co.reload
puts co.total
co.scan("B")
co.reload
puts co.total
