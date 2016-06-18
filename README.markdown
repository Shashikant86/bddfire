
<a href="https://travis-ci.org/Shashikant86/bddfire/"><img src="https://img.shields.io/travis/Shashikant86/bddfire.svg" /></a>

# bddfire

BDDfire: Automate Mobile & Web apps with less code. An instant Ruby-Cucumber BDD framework which supports various popular open-source libraries like Capybara, Selenium-WebDriver, Poltergeist, Relish, Cuke_sniffer, Rubocop, Appium, Saucelabs, Browserstack. Generate default toolkit around BDD with cucumber and friends. BDDfire can do API testing with RestClient.  It also added support for Docker, Gatling, Axe Accessibility Engine

### BDDfire: Instant Ruby-Cucumber Framework with Docker, Gatling, Accessibility, REST API Testing Support

## Installation

Assuming you got Ruby installed. You can run

    $ gem install bddfire

or include it into the Gemfile

    gem 'bddfire'

## Usage

### Instant Ruby Cucumber Framework

    $ bddfire fire_cucumber


This will create 'cucumber' directory and one command will install Ruby Cucumber framework with all possibly supported tools in the 'cucumber' directory. 

It will look like this : 
![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_setup.gif)

And running your first cucumber test with BDDfire as simpe as this : 

![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_cucumber.gif)

This will create all the directories and files to support following tools
* Capybara
* Selenium-Webdriver
* Poltergeist: PhantomJS based headless driver for capybara
* Docker support to execute scenarios inside docker containers
* Run scenarios in parallel 10 processes and rerun failed scenarios.
* Appium : Mobile test automation Framework
* API Testing : BDDfire uses RestClient to perform API testing
* Saucelabs : Cloud testing framework
* Browserstack : Cloud testing framework
* TestingBot : Cloud testing framework
* Relish : Living Documentation
* Yard : Cucumber documentation
* Rubocop : Ruby code review tool
* CI Support Script

## API Testing 

BDDfire has inbuilt support for the API Testing. BDDfire uses RestClient to make requests to URI. 

You can use predefined API Steps [API based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/rest_api_steps.md)

![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_api.gif)

## Load Testing : Gatling
You can optionally install Gatling load testing setup.

       $ bddfire fire_load
It will setup Load testing environment with gatling. It will create 'load' directory. It's optional but BDDfire will support it to execute your load tests.
![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_load.gif)

## Accessibility Testing : Axe Engine
You can optionally setup Accessibility Testing setup support Axe Engine

     $ bddfire fire_accessibility

It will setup accessibility frameworks in the 'accessibility' directory. It uses Axe engine to run accessibility tests.
![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_accessibility.gif)

## Docker Support

BDDfire allow you execute your cucumber scenarios inside Docker containers. Scenarios with Poltergeist driver can be ran inside containers. One script will do everything for you !

![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_docker.gif)


### Install & Run BDDfire framework

Install your skeleton framework with BDDfire

     $ bddfire fire_cucumber
     $ bddfire fire_load
     $ bddfire fire_accessibility

##### YOUTUBE VIDEO : 
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/qr8jLmOd-mM/0.jpg)](http://www.youtube.com/watch?v=qr8jLmOd-mM)

Now you should have your framework ready inside 'cucumber' directory. Just install predefine Gems or you can add your own Gems.            

     $ cd cucumber
     $ bundle install

Once installed, you can run cucumber with multiple cabybara driver

![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_cucumber.gif)

#Usage
## BDDfire Pre-defined-steps
BDDfire allow us to use predefined steps so that we don't have to write more code while writing cucumber steps. BDDfire has following predefined steps which can be used anytime during your project.

### Browser Based Pre-defined-steps

You can use[Browser based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/capybara_steps.md) steps

### Poltergeist Based Pre-defined-steps
You can use headless Poltergeist based [headless Poltergeist based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/headless_steps.md) steps

### API Based Pre-defined Steps 

Just tag your scenario/feature with @api and You can use inbuilt predefined API Steps [API based](https://github.com/Shashikant86/bddfire/blob/master/pre-defined-steps/rest_api_steps.md)

### Accessibility related Pre-defined-steps

You can also use [Accessibility steps](https://github.com/Shashikant86/bddfire/blob/major-refactor/pre-defined-steps/accessibility_steps.md)


### Parallel Cucumber & Re-run Failed

You can run entire test suite in 10 different processes but you can increase number of processes. The reports are generated for each process. If any scenario failed it will re-run. It will use poltergeist by default but you can change in Rakefile

         $ bundle exec rake parallel_cucumber

### Selenium Firefox
You can use selenium driver to run scenario in browser [firefox].

      $ bundle exec rake selenium

###Headless Poletergeist
You can use PhantomJS based Capybara driver Poltergeist driver.

      $ bundle exec rake poltergeist

###Chrome Driver
You can run your scenarios in Google Chrome

           $ bundle exec rake chrome

### REST API Testing 
You can run your scenarios in Google Chrome

           $ bundle exec rake api


![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_api.gif)



###Cloud Testing Frameworks
 Please enter your USERNAME and KEY in the env.rb file

         $ bundle exec rake sauce/browserstack/testingbot


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


## Docker

We can run our cucumber scenario inside Docker containers. Assuming you have Docker installed. Check your Docker installation before using.

      $ bundle exec rake docker
This will build Docker image 'bddfire-ci' and run cucumber scenarios inside container 'bddfire-ci'. 
![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_docker.gif)

##### YOUTUBE VIDEO

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/MQub3qHRwkM/0.jpg)](http://www.youtube.com/watch?v=MQub3qHRwkM)

## Gatling

You can use Gatling setup to execute load tests against your endpoints. Simply change 'load/user-files/simulation/SampleLoadTEST.scala' file and puts your URL to Test as base URL.

          $ cd load
          $ sh gatling_local.sh
This will run load tests against your url. You are free to record new simulations. Once finished there will be link to HTML report at the end.
![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_load.gif)

There is CI integration to plug it with jenkins.

##### YOUTUBE VIDEO

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/h6MBXGAeUVY/0.jpg)](http://www.youtube.com/watch?v=h6MBXGAeUVY)


## Accessibility Testing : Axe

We can run accessibility checks on our web page using BDDfire. You have to pass URL as environment variable e.g

       $ cd accessibility
       $ bundle exec cucumber -r features URL="http://www.google.co.uk"

![image](https://github.com/Shashikant86/bddfire-gifs/blob/master/bddfire_accessibility.gif)
##### YOUTUBE VIDEO

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/aGPO_Bt5nmw/0.jpg)](http://www.youtube.com/watch?v=qr8jLmOd-mM)

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
