# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.
require 'fileutils.rb'

JASNODE_BIN = File.join(File.dirname(__FILE__), '..', '..', 'bin')

Given /^I am ready to work$/ do
end

When /^I give the jasnode command init "([^\"]*)"$/ do |projectname|
  @name = projectname
  %x[#{JASNODE_BIN}/jasnode init #{@name}].should == "Project template initialized at `#{@name}'\n    \n    newproject\n    |-- bin\n    |   `-- hello_world           <- replace with your main executable\n    |-- lib\n    |   `-- server.js             <- your libraries go here\n    |-- Rakefile\n    `-- spec\n        |-- README.md\n        |-- runner.js             <- you'll need to add your libraries here\n        |-- server\n        |   |-- server_spec.js    <- test specs, replace with your own\n        |   `-- spec_server.js\n        `-- spec.js\n\n"
end

Then /^I should have a properly populated "([^\"]*)" directory$/ do |arg1|
  File.exist?("#{@name}").should == true
  File.exist?("#{@name}/lib").should == true
  File.exist?("#{@name}/spec").should == true
  File.exist?("#{@name}/bin").should == true
  File.exist?("#{@name}/Rakefile").should == true
  FileUtils.rm_rf("#{@name}")
  File.exist?("#{@name}").should == false
end

Given /^a jasnode directory$/ do
  @name = "spectest"
  %x[#{JASNODE_BIN}/jasnode init #{@name}].should == "Project template initialized at `#{@name}'\n    \n    spectest\n    |-- bin\n    |   `-- hello_world           <- replace with your main executable\n    |-- lib\n    |   `-- server.js             <- your libraries go here\n    |-- Rakefile\n    `-- spec\n        |-- README.md\n        |-- runner.js             <- you'll need to add your libraries here\n        |-- server\n        |   |-- server_spec.js    <- test specs, replace with your own\n        |   `-- spec_server.js\n        `-- spec.js\n\n"
end

When /^I give the jasnode command spec$/ do
  Dir.chdir(@name)
  @output = %x[../#{JASNODE_BIN}/jasnode spec]
end

Then /^I should see test results$/ do
  @output = @output.split("\n")
  @output[-1].should == "\e[1m12 examples\e[22m, \e[32m0 failures\e[39m"
  Dir.chdir("..")
  FileUtils.rm_rf("#{@name}")
end
