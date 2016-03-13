require 'rubygems'
require 'bundler/setup'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'axe/cucumber/step_definitions'
require 'rest-client'
require 'rspec'
require 'capybara/rspec'
require 'be_valid_asset'
include BeValidAsset

BeValidAsset::Configuration.display_invalid_content = true


url = ENV['URL']
ban = ENV['EXCLUDE'] || "#crapy-selector"

Capybara.current_driver = :poltergeist
Capybara.default_driver = :poltergeist
Capybara.configure do |config|
  config.run_server = false
  config.javascript_driver = config.default_driver
  config.default_selector = :css
  config.default_wait_time = 60
end
Capybara.register_driver :poltergeist do |app|
  options = {
    :js_errors => false,
    :timeout => 180,
    :debug => false
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Before do
  Capybara.use_default_driver
end

After do
  Capybara.reset_sessions!
end
