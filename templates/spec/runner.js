// jasmine spec runner: created by "jasnode init"

// default modules required by almost everything
var sys = require('sys');
http = require('http');

// tell node where to look for spec libraries
require.paths.push("../lib");

// jasnode.js is a file created by jasnode. It contains Pivotal's jasmine and additional wrapper code as needed to run jasmine specs.
var jasmine = require('jasnode');

// server.js is the example file built by the templage, replace with your own
server = require('server');

jasmine.run_specs();