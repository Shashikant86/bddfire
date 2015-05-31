BDD Scenarios
========================

## Install

Your description to install project

            $ bundle install
 Make sure you are using corect ruby version.

## Usage
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
