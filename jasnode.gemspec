# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jasnode}
  s.version = "0.4.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cory Ondrejka"]
  s.date = %q{2010-03-31}
  s.default_executable = %q{jasnode}
  s.description = %q{Easy Jasmine BDD with Node.js}
  s.email = %q{cory.ondrejka+jasnode@gmail.com}
  s.executables = ["jasnode"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".gitignore",
     ".gitmodules",
     "MIT.LICENSE",
     "README.md",
     "Rakefile",
     "VERSION.yml",
     "bin/jasnode",
     "features/jasnode.feature",
     "features/step_definitions/jasnode-steps.rb",
     "jasmine/MIT.LICENSE",
     "jasmine/README.markdown",
     "jasmine/Rakefile",
     "jasmine/cruise_config.rb",
     "jasmine/doc/files.html",
     "jasmine/doc/index.html",
     "jasmine/doc/symbols/_global_.html",
     "jasmine/doc/symbols/jasmine.Block.html",
     "jasmine/doc/symbols/jasmine.Clock.html",
     "jasmine/doc/symbols/jasmine.Env.html",
     "jasmine/doc/symbols/jasmine.JsApiReporter.html",
     "jasmine/doc/symbols/jasmine.Matchers.html",
     "jasmine/doc/symbols/jasmine.MultiReporter.html",
     "jasmine/doc/symbols/jasmine.NestedResults.html",
     "jasmine/doc/symbols/jasmine.Reporter.html",
     "jasmine/doc/symbols/jasmine.Runner.html",
     "jasmine/doc/symbols/jasmine.Spec.html",
     "jasmine/doc/symbols/jasmine.Spy.html",
     "jasmine/doc/symbols/jasmine.Suite.html",
     "jasmine/doc/symbols/jasmine.html",
     "jasmine/doc/symbols/jasmine.util.html",
     "jasmine/doc/symbols/src/lib_TrivialReporter.js.html",
     "jasmine/doc/symbols/src/src_Block.js.html",
     "jasmine/doc/symbols/src/src_Env.js.html",
     "jasmine/doc/symbols/src/src_JsApiReporter.js.html",
     "jasmine/doc/symbols/src/src_Matchers.js.html",
     "jasmine/doc/symbols/src/src_MultiReporter.js.html",
     "jasmine/doc/symbols/src/src_NestedResults.js.html",
     "jasmine/doc/symbols/src/src_PrettyPrinter.js.html",
     "jasmine/doc/symbols/src/src_Queue.js.html",
     "jasmine/doc/symbols/src/src_Reporter.js.html",
     "jasmine/doc/symbols/src/src_Reporters.js.html",
     "jasmine/doc/symbols/src/src_Runner.js.html",
     "jasmine/doc/symbols/src/src_Spec.js.html",
     "jasmine/doc/symbols/src/src_Suite.js.html",
     "jasmine/doc/symbols/src/src_WaitsBlock.js.html",
     "jasmine/doc/symbols/src/src_WaitsForBlock.js.html",
     "jasmine/doc/symbols/src/src_base.js.html",
     "jasmine/doc/symbols/src/src_mock-timeout.js.html",
     "jasmine/doc/symbols/src/src_util.js.html",
     "jasmine/examples/html/example_runner.html",
     "jasmine/examples/html/spec/example_suite.js",
     "jasmine/examples/ruby/Rakefile",
     "jasmine/examples/ruby/spec/example/example_spec.js",
     "jasmine/examples/ruby/spec/jasmine_helper.rb",
     "jasmine/examples/ruby/spec/jasmine_spec.rb",
     "jasmine/examples/ruby/spec/saucelabs.yml",
     "jasmine/geminstaller.yml",
     "jasmine/images/fail-16.png",
     "jasmine/images/fail.png",
     "jasmine/images/go-16.png",
     "jasmine/images/go.png",
     "jasmine/images/pending-16.png",
     "jasmine/images/pending.png",
     "jasmine/images/question-bk.png",
     "jasmine/images/questionbk-16.png",
     "jasmine/images/spinner.gif",
     "jasmine/lib/TrivialReporter.js",
     "jasmine/lib/consolex.js",
     "jasmine/lib/jasmine-0.10.2.js",
     "jasmine/lib/jasmine.css",
     "jasmine/lib/json2.js",
     "jasmine/spec/jasmine_helper.rb",
     "jasmine/spec/jasmine_spec.rb",
     "jasmine/spec/runner.html",
     "jasmine/spec/saucelabs.yml",
     "jasmine/spec/suites/CustomMatchersSpec.js",
     "jasmine/spec/suites/EnvSpec.js",
     "jasmine/spec/suites/ExceptionsSpec.js",
     "jasmine/spec/suites/JsApiReporterSpec.js",
     "jasmine/spec/suites/MatchersSpec.js",
     "jasmine/spec/suites/MockClockSpec.js",
     "jasmine/spec/suites/MultiReporterSpec.js",
     "jasmine/spec/suites/NestedResultsSpec.js",
     "jasmine/spec/suites/PrettyPrintSpec.js",
     "jasmine/spec/suites/QueueSpec.js",
     "jasmine/spec/suites/ReporterSpec.js",
     "jasmine/spec/suites/RunnerSpec.js",
     "jasmine/spec/suites/SpecRunningSpec.js",
     "jasmine/spec/suites/SpecSpec.js",
     "jasmine/spec/suites/SpySpec.js",
     "jasmine/spec/suites/SuiteSpec.js",
     "jasmine/spec/suites/TrivialReporterSpec.js",
     "jasmine/spec/suites/UtilSpec.js",
     "jasmine/src/Block.js",
     "jasmine/src/Env.js",
     "jasmine/src/JsApiReporter.js",
     "jasmine/src/Matchers.js",
     "jasmine/src/MultiReporter.js",
     "jasmine/src/NestedResults.js",
     "jasmine/src/PrettyPrinter.js",
     "jasmine/src/Queue.js",
     "jasmine/src/Reporter.js",
     "jasmine/src/Reporters.js",
     "jasmine/src/Runner.js",
     "jasmine/src/Spec.js",
     "jasmine/src/Suite.js",
     "jasmine/src/WaitsBlock.js",
     "jasmine/src/WaitsForBlock.js",
     "jasmine/src/base.js",
     "jasmine/src/mock-timeout.js",
     "jasmine/src/util.js",
     "jasmine/src/version.json",
     "jasnode.gemspec",
     "lib/jasnode.rb",
     "lib/jasnode/core.rb",
     "spec/jasnode/jasnode_spec.rb",
     "spec/rspec_suite.rb",
     "spec/spec_helper.rb",
     "templates/Rakefile",
     "templates/bin/hello_world",
     "templates/lib/server.js",
     "templates/spec/README.md",
     "templates/spec/runner.js",
     "templates/spec/server/server_spec.js",
     "templates/spec/server/spec_server.js",
     "templates/spec/spec.js"
  ]
  s.homepage = %q{http://angrybits.github.com/jasnode}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Jasmine Ruby Runner}
  s.test_files = [
    "spec/jasnode/jasnode_spec.rb",
     "spec/rspec_suite.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<commander>, [">= 4.0.2"])
    else
      s.add_dependency(%q<commander>, [">= 4.0.2"])
    end
  else
    s.add_dependency(%q<commander>, [">= 4.0.2"])
  end
end

