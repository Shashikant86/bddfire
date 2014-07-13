require 'rubygems'
require 'bundler/setup'
require "Capybara/cucumber"
require "rspec"
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'rubocop'

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

Capybara.register_driver :sauce do |app|
  job_name = "Cucumber-Tests - #{Time.now.strftime '%Y-%m-%d %H:%M'}"
  browser =  ENV['SAUCE_BROWSER']  || 'firefox'
  version =  ENV['SAUCE_VERSION']  || '3.6'
  platform = ENV['SAUCE_PLATFORM'] || 'WINDOWS'
  duration = 7200
  capabilities = {:browserName => browser, :version => version, :platform => platform, :name => job_name, "max-duration" => duration}
  puts "Running #{job_name} on SauceLabs with #{browser} #{version} on #{platform}"
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :desired_capabilities => capabilities,
    :url => "http://SAUCE_USERNAME:SAUCE_API_KEY@ondemand.saucelabs.com:80/wd/hub")
end

Capybara.register_driver :appium do |app|
    browserName = ENV['APPIUM_BROWSER_NAME'] || 'iOS'
    device = ENV['APPIUM_DEVICE'] || 'iPhone Simulator'
    platform = ENV['APPIUM_OS'] || 'Mac'
    os_version = ENV['APPIUM_OS'] || '6.1'
    app = ENV['APPIUM_OS'] || 'safari'
    capabilities = {:browserName => browserName,  :os_version => os_version, :device => device,  "platform" => platform, "app"=>app}
Capybara::Selenium::Driver.new(app,
                                 :browser => :remote,
                                 :desired_capabilities => capabilities,
                                 :url => "http://0.0.0.0:4723/wd/hub")
end
