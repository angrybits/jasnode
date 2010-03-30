# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.

dir = File.join(File.dirname(__FILE__), "**","*_spec.rb")
specs = Dir[dir]
specs.each do |file|
  require file
end