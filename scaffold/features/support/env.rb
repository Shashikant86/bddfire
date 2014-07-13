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

Capybara.register_driver :browserstack do |app|
    stackToUse = ENV['BS_STACK'] || 'osx_firefox'
    json = JSON.load(open(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'browsers.json'))))
    config = json[stackToUse]
    unless config
      puts "invalid BS_STACK specified. Was '#{stackToUse}'"
      return
    end

    # Add default config
    config['name'] = "#{config['os']} #{config['os_version']} - #{Time.now.strftime '%Y-%m-%d %H:%M'}"
    config['acceptSslCert'] = false
    config['browserstack.debug'] = true

    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :desired_capabilities => config,
      :url => "http://USERNAME:API_KEY@hub.browserstack.com/wd/hub"
    )
end
