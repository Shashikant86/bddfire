# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'bddfire/version'

Gem::Specification.new do |s|
  s.name        = 'bddfire'
  s.version     = BDDfire::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Shashikant Jagtap']
  s.email       = ['shashikant.jagtap@aol.co.uk']
  s.homepage    = 'https://github.com/Shashikant86/bddfire'
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.summary     = 'BDDfire: Automate Mobile & Web apps with less code. An instant Ruby-Cucumber BDD framework'
  s.description = 'A Wholesale framework for web, mobile, api, load, accessibility testing. Get you going in a minute. An instant setup of Ruby, Cucumber, Capybara, selenium, REST API Appium, Docker, Gatling and Axe Engine'
  s.add_runtime_dependency "bundler"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "parallel_cucumber"
  s.add_runtime_dependency "cucumber"
  s.add_runtime_dependency "capybara"
  s.add_runtime_dependency "poltergeist"
  s.add_runtime_dependency "rake"
  s.add_runtime_dependency "yard-cucumber"
  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "selenium-webdriver"
  s.add_runtime_dependency "axe-matchers"
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'redcarpet'
  s.add_runtime_dependency 'rubocop'
  s.add_runtime_dependency 'cuke_sniffer'
  s.add_runtime_dependency 'relish'
  s.add_runtime_dependency 'rubocop-checkstyle_formatter'
  s.add_runtime_dependency 'site_prism'
  s.add_runtime_dependency 'chromedriver-helper'
  s.add_runtime_dependency 'magic_encoding'
  s.add_runtime_dependency 'be_valid_asset'
  s.add_runtime_dependency 'require_all', '~> 1.3.1', '>= 1.3.0'
  s.add_development_dependency 'aruba', '~> 0.14.1'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.post_install_message = '======== Thanks for installing BDDfire. You can now perform Web, API, Mobile, Accessibility, Load Testing with single framework !!==================== '
end
