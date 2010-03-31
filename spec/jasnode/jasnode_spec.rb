require File.join(File.dirname(__FILE__), "..", "spec_helper")
require "ftools"
 
describe Jasnode::Spec do
  before(:all) do
    template_base = File.join(File.dirname(__FILE__), '..', "..", 'templates')
    @name = File.expand_path(File.join(File.dirname(__FILE__), "spectest"))
    File.makedirs("#{@name}")
    FileUtils.cp_r("#{template_base}/.", @name)
  end
  
  after(:all) do
 #   FileUtils.rm_rf(@name)
  end
  
  it "should find all the javascript spec files" do
    Jasnode::Spec.find_specs(@name).should == ["/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/server_spec.js", "/Users/cory/src/jasnode/spec/jasnode/spectest/spec/spec.js", "/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/spec_server.js"]
  end
  
  it "should find the current jasmine lib" do
    Jasnode::Spec.find_jasmine.should == ["/Users/cory/src/jasnode/lib/jasnode/../../jasmine/lib/jasmine-0.10.2.js"]
  end
  
  it "should correctly generate the text to build a jasmine runner" do
    Jasnode::Spec.build_jasmine_test_file(Jasnode::Spec.find_jasmine, Jasnode::Spec.find_specs(@name), true).should == "// This file is autogenerated by jasnode\n// It was inspired by node-jasmine (c) 2010 Adam Abrons and Misko Hevery http://getangular.com\n// Copyright (c) 2010 Cory Ondrejka. All rights reserved.\n// See MIT.LICENSE for licensing details.\n\nvar fs = require('fs');\nvar sys = require('sys');\n\nvar filename = '/Users/cory/src/jasnode/lib/jasnode/../../jasmine/lib/jasmine-0.10.2.js';\nvar src = fs.readFileSync(filename);\n\n// give jasmine values to bind\nglobal.window = {\n    setTimeout: setTimeout,\n    clearTimeout: clearTimeout,\n    setInterval: setInterval,\n    clearInterval: clearInterval\n};\n\nvar jasmine = process.compile(src + '\\njasmine;', filename);\n\ndelete global.window;\n\njasmine.run_specs = function() {\n  var log = [];\n  var columnCounter = 0;\n  var verbose = true;\n  \n  // process in specs collected by jasnode\n  process.compile(fs.readFileSync('/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/server_spec.js'), '/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/server_spec.js');\n  process.compile(fs.readFileSync('/Users/cory/src/jasnode/spec/jasnode/spectest/spec/spec.js'), '/Users/cory/src/jasnode/spec/jasnode/spectest/spec/spec.js');\n  process.compile(fs.readFileSync('/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/spec_server.js'), '/Users/cory/src/jasnode/spec/jasnode/spectest/spec/server/spec_server.js');\n\n  \n  // override jasmine reporter base class\n  var jasmineEnv = jasmine.getEnv();\n  jasmineEnv.reporter = {\n    log: function(str){\n    },\n\n    reportRunnerStarting: function(runner) {\n      date = new Date();\n      sys.puts('Starting spec run at ' + date.getHours() + \":\" + date.getMinutes() + \":\" + date.getSeconds());\n      start = date.getTime();\n    },\n\n    reportSuiteResults: function(suite) {\n      var spec_results = suite.results();\n      var path = [];\n      while(suite) {\n        path.unshift(suite.description);\n        suite = suite.parentSuite;\n      }\n      var description = path.join(' -> ');\n\n      spec_results.items_.forEach(function(spec){\n        if (spec.failedCount > 0 && spec.description) {\n          log.push(description + '\\n');\n          log.push(' it ' + spec.description + '\\n');\n          spec.items_.forEach(function(result){\n            log.push(' ' + result.trace.stack + '\\n');\n          });\n        }\n      });\n    },\n\n    reportSpecResults: function(spec) {\n      sys.print(spec.results().failedCount ? \"F\" : \".\");\n      if (columnCounter++ < 50) return;\n      columnCounter = 0;\n      sys.print('\\n');\n    },\n\n    reportRunnerResults: function(runner) {\n      elapsed = (Number(new Date) - start) / 1000;\n      sys.puts('\\n');\n      if (verbose)\n        log.forEach(function(log){ sys.puts(log); });\n        \n      sys.puts('\\n');\n      sys.puts('Finished in ' + elapsed + ' seconds');\n      sys.puts(jasmine.results(runner));\n      process.exit(runner.results().failedCount);\n    }\n  };\n  jasmineEnv.execute();\n};\n\n// print out the results\njasmine.results = function(runner){\n  var results = runner.results();\n  var suites = runner.suites();\n  var msg = '';\n  msg += \"\\033[1m\" + results.totalCount + ' example' + ((results.totalCount === 1) ? '' : 's') + '\\033[22m, ';\n  if (0 == results.failedCount)\n    msg += \"\\033[32m\" + results.failedCount + ' failure' + ((results.failedCount === 1) ? '' : 's') + '\\033[39m\\n';\n  else\n    msg += \"\\033[31m\" + results.failedCount + ' failure' + ((results.failedCount === 1) ? '' : 's') + '\\033[39m\\n';\n  return msg;\n};\n\n// create a busy wait to allow for async testing\njasmine.async_spec_wait = function() {\n  var wait = jasmine.async_spec_wait;\n  wait.start = new Date().getTime();\n  wait.done = false;\n  (function inner_wait(){\n    waits(10);\n    runs(function() {\n      if (wait.start + wait.timeout < new Date().getTime()) {\n        expect('timeout waiting for spec').toBeNull();\n      } else if (wait.done) {\n        wait.done = false;\n      } else {\n        inner_wait();\n      }\n    });\n  })();  \n};\n\n// timeout after 10 seconds of waiting\njasmine.async_spec_wait.timeout = 10 * 1000;\n\njasmine.async_spec_done = function() {\n  jasmine.async_spec_wait.done = true;\n};\n\n// make sure all the jasmine methods are available\nfor ( var key in jasmine) {\n  exports[key] = jasmine[key];\n}\n"
  end
  
  it "should save the jasmine runner into the appropriate locations" do
    File.open(File.join(@name,"lib", "jasnode.js"), "w") {|f| f.write(Jasnode::Spec.build_jasmine_test_file(Jasnode::Spec.find_jasmine, Jasnode::Spec.find_specs(@name), true)) }
    File.exist?("#{@name}/lib/jasnode.js").should == true
  end

  it "should handle the command line" do
    Dir.chdir(@name)
    output = %x[../../../bin/jasnode spec]
    output = output.split("\n")
    output[-1].should == "\e[1m12 examples\e[22m, \e[32m0 failures\e[39m"
  end

end