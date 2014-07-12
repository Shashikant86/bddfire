# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bddfire/version"

Gem::Specification.new do |s|
  s.name        = "bddfire"
  s.version     = BDDfire::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shashikant Jagtap"]
  s.email       = ["shashikant.jagtap@aol.co.uk"]
  s.homepage    = "https://github.com/Shashikant86/bddfire"
  s.license       = 'MIT'
  s.summary     = %q{Generate template project for the cucumber BDD with related tools}
  s.description = %q{Blue print for the cucumber, capybara, cuke_sniffer, rubocop, relish, yard and many of them libraries}
  s.add_dependency "thor"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_development_dependency "yard"
  s.add_development_dependency "bluecloth"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "relish"
  s.add_development_dependency "cuke_sniffer"
  s.add_development_dependency "parallel_tests"
  s.require_paths = ["lib"]
end
