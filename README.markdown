# bddfire

Generate default toolkit around BDD with cucumber and friends
## Installation

The usual:

    $ gem install bddfire
    
## Usage

In your project's root directory...

### Cucumber

    $ bddfire fire_cucumber


This will create a `features` directory with all the files you need to hit the

If you don't already have a `Gemfile` or `Rakefile`, one will be created.

Output will look like this:

      append  Gemfile
      append  Rakefile
      identical  features/step_definitions/{directoryname}_steps.rb
      identical  features/try.feature
      identical  config_files/cucumber.yml
      identical  config_files/.rubocop.yml
      create  config_files/.ruby-version
      create  config_files/.travis.yml
      create  config_files/.relish
      create  features/support/env.rb
      create  features/support/hooks.rb
      create  features/support/responsive.rb
      create  features/support/helpers.rb
      create  .gitignore

