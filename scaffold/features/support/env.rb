require 'rubygems'
require 'bundler/setup'
require 'capybara/cucumber'
require 'rspec'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'rubocop'
require 'axe/cucumber/step_definitions'
require 'bddfire'
require 'rest-client'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = (ENV['DRIVER'] || 'selenium').to_sym
  config.javascript_driver = config.default_driver
  config.default_selector = :xpath
  config.default_wait_time = 60
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  Capybara::Selenium::Driver.new(app, profile: profile)
end

Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: true,
    timeout: 120,
    debug: false,
    phantomjs_options: ['--load-images=no', '--disk-cache=false'],
    inspector: true

  }

  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
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
                                 browser: :remote,
                                 desired_capabilities: config,
                                 url: 'http://USERNAME:API_KEY@hub.browserstack.com/wd/hub'
                                )
end

Capybara.register_driver :testingbot do |app|
  stackToUse = ENV['TB_STACK'] || 'osx_firefox'
  json = JSON.load(open(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'browsers.json'))))
  config = json[stackToUse]
  unless config
    puts "invalid TB_STACK specified. Was '#{stackToUse}'"
    return
  end

  # Add default config
  config['name'] = "#{config['os']} #{config['os_version']} - #{Time.now.strftime '%Y-%m-%d %H:%M'}"
  config['acceptSslCert'] = false

  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: config,
                                 url: 'http://KEY:SECRET@hub.testingbot.com/wd/hub'
                                )
end

Capybara.register_driver :sauce do |app|
  job_name = "Cucumber-Tests - #{Time.now.strftime '%Y-%m-%d %H:%M'}"
  browser =  ENV['SAUCE_BROWSER']  || 'firefox'
  version =  ENV['SAUCE_VERSION']  || '3.6'
  platform = ENV['SAUCE_PLATFORM'] || 'WINDOWS'
  duration = 7200
  capabilities = { :browserName => browser, :version => version, :platform => platform, :name => job_name, 'max-duration' => duration }
  puts "Running #{job_name} on SauceLabs with #{browser} #{version} on #{platform}"
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: capabilities,
                                 url: 'http://SAUCE_USERNAME:SAUCE_API_KEY@ondemand.saucelabs.com:80/wd/hub')
end

Capybara.register_driver :appium_android_web do |app|
  capabilities = { platformName: 'Android', deviceName: 'android', browserName: 'Chrome', uuid: ENV['ADB_SERIAL'] }
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: capabilities,
                                 url: 'http://0.0.0.0:4723/wd/hub')
end

Capybara.register_driver :appium do |app|
  capabilities = {
    automationName: 'Appium', # Appium (default) or Selendroid
    app: '/path/to/app',                  # /abs/path/to/my.apk or http://myapp.com/app.ipa
    platformName: 'Android',              # iOS, Android, or FirefoxOS
    platformVersion: ' ',                 #  7.1, 4.4
    deviceName: 'Android',                # iPhone Simulator, iPad Simulator, iPhone Retina 4-inch, Android Emulator, Galaxy S4, etc…. On iOS, this should be one of the valid devices returned by instruments with instruments -s devices. On Android this capability is currently ignored.
    browserName: 'Chrome',                #  ‘Safari’ for iOS and ‘Chrome’, ‘Chromium’, or ‘Browser’ for Android
    newCommandTimeout: '60',              # 60
    autoLaunch: 'true',                   # true, false
    language: ' ',                        # fr
    locale: ' ',                          # fr_CA
    orientation: ' ',
    autoWebview: 'false',                 # true, false
    noReset: 'false',                     # true, false
    fullReset: 'false',                   # true, false
    uuid: ENV['ADB_SERIAL'],
    #  Android Only Capabilities
    appActivity: ' ',
    appPackage: ' ',
    appWaitActivity: ' ',
    appWaitPackage: ' ',
    deviceReadyTimeout: ' ',
    androidCoverage: ' ',
    enablePerformanceLogging: ' ',
    androidDeviceReadyTimeout: ' ',
    androidDeviceSocket: ' ',
    avd: ' ',
    avdLaunchTimeout: ' ',
    avdReadyTimeout: ' ',
    avdArgs: ' ',
    useKeystore: ' ',
    keystorePath: ' ',
    keystorePassword: ' ',
    keyAlias: ' ',
    keyPassword: ' ',
    chromedriverExecutable: ' ',
    autoWebviewTimeout: ' ',
    intentAction: ' ',
    intentCategory: ' ',
    intentFlags: ' ',
    optionalIntentArguments: ' ',
    stopAppOnReset: ' ',
    unicodeKeyboard: ' ',
    resetKeyboard: ' ',
    noSign: ' ',
    ignoreUnimportantViews: ' ',
    # iOS Only
    calendarFormat: ' ',
    bundleId: ' ',
    udid: ' ',
    launchTimeout: ' ',
    locationServicesEnabled: ' ',
    locationServicesAuthorized: ' ',
    autoAcceptAlerts: ' ',
    autoDismissAlerts: ' ',
    nativeInstrumentsLib: ' ',
    nativeWebTap: ' ',
    safariInitialUrl: ' ',
    safariAllowPopups: ' ',
    safariIgnoreFraudWarning: ' ',
    safariOpenLinksInBackground: ' ',
    keepKeyChains: ' ',
    localizableStringsDir: ' ',
    processArguments: ' ',
    interKeyDelay: ' ',
    showIOSLog: ' ',
    sendKeyStrategy: ' ',
    screenshotWaitTimeout: ' ',
    waitForAppScript: ' '
  }
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: capabilities,
                                 url: 'http://0.0.0.0:4723/wd/hub')
end
