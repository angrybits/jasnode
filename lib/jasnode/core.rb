# Copyright (c) 2010 Cory Ondrejka. All rights reserved.
# See MIT.LICENSE for licensing details.

module Jasnode
  class Spec
    def self.find_specs(root_dir)
    end

    def self.build_jasmine_test_file
    end
    
    def self.run_specs
    end
  end
  
  class Init
    def self.template(projectname)
      require "ftools"
      template_base = File.expand_path File.join(File.dirname(__FILE__), '..', '..', 'templates')
      
      File.makedirs("#{projectname}")
      FileUtils.cp_r("#{template_base}/.", "#{projectname}")
    end
  end
end