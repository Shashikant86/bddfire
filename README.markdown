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
