require 'rubygems'
require 'rake'
 
unless File.exists?('jasmine/lib')
  raise "Jasmine submodule isn't present. Run git submodule update --init"
end

require 'spec/rake/spectask'

Spec::Rake::SpecTask.new('examples') do |t|
  t.spec_files = FileList['spec/rspec_suite.rb']
end

require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

require 'jeweler'
Jeweler::Tasks.new do |gemspec|
  gemspec.name = "jasnode"
  gemspec.summary = "Jasmine Ruby Runner"
  gemspec.description = "Easy Jasmine BDD with Node.js"
  gemspec.email = "cory.ondrejka+jasnode@gmail.com"
  gemspec.homepage = "http://angrybits.github.com/jasnode"
  gemspec.authors = ["Cory Ondrejka"]
  gemspec.add_dependency('commander', '>= 4.0.2')
  gemspec.add_dependency('jeweler', '>= 1.4.0')
  gemspec.executables = ["jasnode"]
  gemspec.files.include %w( jasmine/**/* )
end