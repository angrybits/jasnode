# Jasnode

Inspired by [node-jasmine](http://github.com/mhevery/jasmine-node), Angrybits Jasmine is a simple way to use Pivotal's [jasmine](http://github.com/pivotal/jasmine) with [Node.js](http://github.com/ry/node).

## Getting Started

Grab the gem

    $ [sudo] gem install jasnode
    
Create a project template

    $ jasnode MyProject
    
This will create the following hierarchy

    MyProject
    |-- bin
    |   `-- hello_world           <- replace with your main executable
    |-- lib
    |   `-- server.js             <- your libraries go here
    |-- Rakefile
    `-- spec
        |-- README.md
        |-- runner.js             <- you'll need to add your libraries here
        |-- server
        |   |-- server_spec.js    <- test specs, replace with your own
        |   `-- spec_server.js
        `-- spec.js
    
You can then run the jasmine tests using node

    $ cd MyProject
    $ jasnoda spec
    
You can also use common rake tasks

    $ rake
    $ rake test
    $ rake cruise
    $ rake examples
    
All of these map to

    $ jasnoda spec
    
The exit value is the number of failures, so 0 in the success case, so this should play nicely with CI and other tools.
    
## License

Copyright (c) 2010 Cory Ondrejka
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.