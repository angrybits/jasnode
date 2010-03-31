# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.
JASNODE_BIN = File.join(File.dirname(__FILE__), '..', '..', 'bin')

Given /^I am ready to work$/ do
end

When /^I give the jasnode command init "([^\"]*)"$/ do |projectname|
  @name = projectname
  %x[#{JASNODE_BIN}/jasnode init #{@name}].should == "Project template initialized at `#{@name}'\n"
end

Then /^I should have a properly populated "([^\"]*)" directory$/ do |arg1|
  require "ftools"
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
  %x[#{JASNODE_BIN}/jasnode init #{@name}].should == "Project template initialized at `#{@name}'\n"
end

When /^I give the jasnode command spec$/ do
  Dir.chdir(@name)
  @output = %x[../#{JASNODE_BIN}/jasnode spec]
end

Then /^I should see test results$/ do
  @output = @output.split("\n")
  @output[-1].should == "\e[1m12 examples\e[22m, \e[32m0 failures\e[39m"
end
