# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.

Feature: Running jasmine with node.js
  In order to be able to test node.js server programs
  As a developer
  I want a simple way to create and run jasmine tests with node.js
  
Scenario: correctly initialize directories
  Given I am ready to work
  When I give the jasnode command init "newproject"
  Then I should have a properly populated "newproject" directory

Scenario: title
  Given context
  When event
  Then outcome






  
