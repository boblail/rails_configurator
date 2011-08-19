# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_configurator/version"

Gem::Specification.new do |s|
  s.name        = "rails_configurator"
  s.version     = RailsConfigurator::VERSION
  s.authors     = ["Robert Lail"]
  s.email       = ["robert.lail@cph.org"]
  s.homepage    = ""
  s.summary     = %q{extend Rails::Configuration}
  s.description = %q{extend Rails::Configuration}
  
  s.rubyforge_project = "rails_configurator"
  
  s.add_dependency "rails"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
