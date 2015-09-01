# bddfire

BDDfire: Automate Mobile & Web apps with less code. An instant Ruby-Cucumber BDD framework which supports various popular open-source libraries like Capybara, Selenium-WebDriver, Poltergeist, Relish, Cuke_sniffer, Rubocop, Appium, Saucelabs, Browserstack.Generate default toolkit around BDD with cucumber and friends

### ===BDDfire: Write your tests not Framework===

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
* Run scenarios in parallel 10 processes and rerun failed scenarios.
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

Once installed, you can run cucumber with multiple cabybara driver

#Usage
### Pre-defined-steps
You can use[Browser based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/capybara_steps.md) steps
You can use headless Poltergeist based [headless Poltergeist based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/headless_steps.md) steps

### Parallel Cucumber & Re-run Failed
You can run entire test suite in 10 different processes but you can increase number of processes. The reports are generated for each process. If any scenario failed it will re-run. It will use poltergeist by default but you can change in Rakefile

         $ rake parallel_cucumber

###Selenium Firefox
You can use selenium driver to run scenario in browser [firefox].

      $ rake selenium

You can run cucumber with profile like this

         $ bundle exec cucumber -p selenium

###Headless Poletergeist
You can use PhantomJS based Capybara driver Poltergeist driver.


You can run cucumber with profile like this

      $ bundle exec cucumber -p poltergeist

OR

      $ rake poltergeist

###Chrome Driver
You can run your scenarios in Google Chrome

           $ rake poltergeist
You can run cucumber with profile like this

           $ bundle exec cucumber -p chrome


###Cloud Testing Frameworks
 Please enter your USERNAME and KEY in the env.rb file

         $ rake sauce/browserstack/testingbot
  OR

      $ bundle exec cucumber -p sauce/browserstack/testingbot

###Appium:
Run Appium server in the background.

     $ npm install
     $ ./node_modules/.bin/appium
OR

     $rake start_appium

 Now run cucumber with appium. Make sure you updated env.rb file with capabilities you want to use for Android.

     $ bundle exec cucumber -p appium ADB_SERIAL=serial_number

 Now run cucumber with appium iOS. Make sure you updated env.rb file with capabilities you want to use for iOS

     $ bundle exec cucumber -p appium

###Cuke_sniffer
You can use cuke_sniffer to detect smells in your Cucumber. It will generate reports in the cuke_sniffer.html in the 'reports' directory.

      $ rake cuke_sniffer

###Rubocop

You can use rubocop to detect ruby errors in your Ruby file

      $ rake rubocop
This will report all the offence in rubocop.

## CI Integration

Currently, you can use the script 'ci_script' on Jenkins or Hudson. More CI Integration is on the way.

You need pass rake rask to the script

      $ ./ci_script features


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
