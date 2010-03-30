# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.

module Jasnode
  class Spec
    def self.find_specs(root_dir)
      dir = File.join(root_dir, "**", "*_spec.js")
      files = Dir[dir]
      dir = File.join(root_dir, "**", "spec.js")
      files += Dir[dir]
      dir = File.join(root_dir, "**", "spec_*.js")
      files += Dir[dir]
      files.uniq
    end
    
    def self.find_jasmine
      dir = File.join(File.dirname(__FILE__),"..","..","jasmine","**","jasmine-*.js")
      Dir[dir]
    end

    def self.build_jasmine_test_file(jasmine, specs)
      spec_list = ""
      specs.each do |spec|
        spec_list += "  process.compile(fs.readFileSync('#{spec}'), '#{spec}');\n"
      end
      <<-eos
// This file is autogenerated by jasnode
// It was inspired by node-jasmine (c) 2010 Adam Abrons and Misko Hevery http://getangular.com
// Copyright (c) 2010 Cory Ondrejka. All rights reserved.
// See MIT.LICENSE for licensing details.

var fs = require('fs');
var sys = require('sys');

var filename = '#{jasmine}';
var src = fs.readFileSync(filename);

// give jasmine values to bind
global.window = {
    setTimeout: setTimeout,
    clearTimeout: clearTimeout,
    setInterval: setInterval,
    clearInterval: clearInterval
};

var jasmine = process.compile(src + '\\njasmine;', filename);

delete global.window;

jasmine.run_specs = function(verbose) {
  var log = [];
  var columnCounter = 0;
  
  // process in specs collected by jasnode
#{spec_list}
  
  // override jasmine reporter base class
  var jasmineEnv = jasmine.getEnv();
  jasmineEnv.reporter = {
    log: function(str){
    },

    reportRunnerStarting: function(runner) {
      start = new Date().getTime();
      sys.puts('Starting spec run at ' + start);
    },

    reportSuiteResults: function(suite) {
      var specResults = suite.results();
      var path = [];
      while(suite) {
        path.unshift(suite.description);
        suite = suite.parentSuite;
      }
      var description = path.join(' ');

      log.push('Spec ' + description);

      specResults.items_.forEach(function(spec){
        if (spec.failedCount > 0 && spec.description) {
          if (!verbose)
              log.push(description);
          log.push(' it ' + spec.description);
          spec.items_.forEach(function(result){
            log.push(' ' + result.trace.stack + '\\n');
          });
        }
      });
    },

    reportSpecResults: function(spec) {
      sys.print(spec.results().failedCount ? "F" : ".");
      if (columnCounter++ < 50) return;
      columnCounter = 0;
      sys.print('\\n');
    },

    reportRunnerResults: function(runner) {
      elapsed = (Number(new Date) - start) / 1000;
      sys.puts('\\n');
      log.forEach(function(log){
        sys.puts(log);
      });
      sys.puts('Finished in ' + elapsed + ' seconds');
    }
  };
  jasmineEnv.execute();
};

// create a busy wait to allow for async testing
jasmine.async_spec_wait = function() {
  var wait = jasmine.async_spec_wait;
  wait.start = new Date().getTime();
  wait.done = false;
  (function inner_wait(){
    waits(10);
    runs(function() {
      if (wait.start + wait.timeout < new Date().getTime()) {
        expect('timeout waiting for spec').toBeNull();
      } else if (wait.done) {
        wait.done = false;
      } else {
        inner_wait();
      }
    });
  })();  
};

// timeout after 10 seconds of waiting
jasmine.async_spec_wait.timeout = 10 * 1000;

jasmine.async_spec_done = function() {
  jasmine.async_spec_wait.done = true;
};

// make sure all the jasmine methods are available
for ( var key in jasmine) {
  exports[key] = jasmine[key];
}
      eos
    end
    
    def self.launch_jasmine
    end
    
    def self.spec
    end
  end
  
  class Init
    def self.template(projectname)
      require "ftools"
      template_base = File.join(File.dirname(__FILE__), '..', '..', 'templates')
      File.makedirs("#{projectname}")
      FileUtils.cp_r("#{template_base}/.", "#{projectname}")
    end
  end
end