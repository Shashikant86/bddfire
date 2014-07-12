require 'rubygems'
require 'bundler/setup'
require "Capybara/cucumber"
require "rspec"
require 'capybara/poltergeist'
require 'selenium-webdriver'

Capybara.default_driver = :selenium

Capybara.register_driver :poltergeist do |app|

    options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,

    }

    Capybara::Poltergeist::Driver.new(app, options)
end
