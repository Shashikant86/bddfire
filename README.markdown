# bddfire

BDDfire: Automate Mobile & Web apps with less code. An instant Ruby-Cucumber BDD framework which supports various popular open-source libraries like Capybara, Selenium-WebDriver, Poltergeist, Relish, Cuke_sniffer, Rubocop, Appium, Saucelabs, Browserstack.Generate default toolkit around BDD with cucumber and friends
## Installation

The usual:

    $ gem install bddfire

or include it into the Gemfile

    gem 'bddfire'

## Usage

In your project's root directory...

### Instant Ruby Cucumber Framework

    $ bddfire fire_cucumber


This will create 'cucumber' direcory and one command will install Ruby Cucumber framework with all possibly supported tools in the 'cucumber' directory. This will create all the directories and files to support following tools
        * Capybara
        * Selenium-Webdriver
        * Poltergeist: PhantomJS based headless driver for capybara
        * Appium : Mobile test automation Framework
        * Saucelabs : Cloud testing framework
        * Browserstack : Cloud testing framework
        * TestingBot : Cloud testing framework
        * Relish : Living Documenation
        * Yard : Cucumber documentation
        * Rubocop : Ruby code review tool
        * CI Support Script


If you don't already have a `Gemfile` or `Rakefile`, one will be created.


### Install & Run BDDfire framework


Now, we need to run bundle install [Fix nokogiri error if you get any by using supported nokogiri version]

     $ cd cucumber
     $ bundle install

Once installed, you can run cucumber with multiple caybara driver

## Don't waste time writing steps. Use predefined

You can use Browser based [pre-defined-steps](predefined-steps/capybara_steps.md)
You can use headless Poltergeist based [pre-defined-steps](predefined-steps/headless_steps.md)


 ##### Use Selenium Firefox

      $ bundle exec cucumber -p selenium

 ##### Use Headless Poletergeist

      $ bundle exec cucumber -p poltergeist

 ##### Use Chrome Driver

           $ bundle exec cucumber -p chrome


 ##### Use Saucelabs :
 Please enter your SAUCE_USERNAME and SAUCELABS key in the env.rb file

     $ bundle exec cucumber -p sauce

 ##### Use Browserstack :
 Please enter your BS_USERNAME and BS_KEY key in the env.rb file

     $ bundle exec cucumber -p browserstak

 ##### Use TestingBot :
 Please enter your TB_KEY and TB_SECRET key in the env.rb file

     $ bundle exec cucumber -p testingbot

 ##### Using Appium:
  run Appium server in the background. You need to have iOS setup.

     $ npm install
     $ ./node_modules/.bin/appium

 Now run cucumber with appium andriod

     $ bundle exec cucumber -p appium_android_web ADB_SERIAL=serial_number

 Now run cucumber with appium iOS

     $ bundle exec cucumber -p appium_ios_web

## Use Rake

You can also use Rake taks created automatically for you

     $ bundle exec rake features

You can run Cuke_sniffer report on your project

      $ bundle exec rake cuke_sniffer

You can run rubocop report on your project

      $ bundle exec rake rubocop


## CI Integration

Currently, you can use the script 'ci_script' on Jenkins or Hudson. More CI inegration is on the way.

You need pass rake rask to the script

      $ ./ci_script features


## Use Rake
You can also use Rake taks created automatically for you

      $ bundle exec rake features

You can run Cuke_sniffer report on your project

      $ bundle exec rake cuke_sniffer

You can run rubocop report on your project

      $ bundle exec rake rubocop


# TODO

* Add more and more steps so that user won't need to write more code
* Add examples to show use of native app automation  


## LICENSE

Copyright © 2014 Shashikant Jagtap, http://shashikantjagtap.net

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contributing

1. Fork it ( https://github.com/Shashikant86/bddfire/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
