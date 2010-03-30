require 'rubygems'
require 'rake'
 
namespace :jeweler do
  unless File.exists?('jasmine/lib')
    raise "Jasmine submodule isn't present. Run git submodule update --init"
  end
 
  begin
    require 'jeweler'
    require 'rake'
    Jeweler::Tasks.new do |gemspec|
      gemspec.name = "jasnode"
      gemspec.summary = "Jasmine Ruby Runner"
      gemspec.description = "Easy Jasmine BDD with Node.js"
      gemspec.email = "cory.ondrejka+jasnode@gmail.com"
      gemspec.homepage = "http://angrybits.github.com/jasnode"
      gemspec.authors = ["Cory Ondrejka"]
      gemspec.executables = ["jasnode"]
    end
    Jeweler::GemcutterTasks.new
  end
