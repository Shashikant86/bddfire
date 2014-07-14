require 'thor'
require 'bddfire/version'

module BDDfire
  class App < Thor
    include Thor::Actions
    map %w(-v -V --version) => :version
    def self.source_root
      File.expand_path('../../scaffold', File.dirname(__FILE__))
    end
    
    desc "version", "current version"
    def version
      say BDDfire::VERSION
    end
    
    desc "fire_cucumber", "Set up cucumber"
    def fire_cucumber
      genarate_gemfile
      insert_gem 'cucumber'
      insert_gem 'capybara'
      insert_gem 'selenium-webdriver'
      insert_gem 'poltergeist'
      insert_gem 'rake'
      insert_gem 'yard-cucumber'
      insert_gem 'redcarpet'
      insert_gem 'rubocop'
      insert_gem 'cuke_sniffer'
      insert_gem 'json'
      insert_gem 'rspec'
      generate_rakefile
      add_task BDDfire::Tasks.cucumber
      add_task BDDfire::Tasks.cuke_sniffer
      add_task BDDfire::Tasks.rubocop
      copy_file "features/step_definitions/google_steps.rb"
      add_file "features/step_definitions/#{project_name}_steps.rb"
      add_file "features/#{project_name}.feature"
      copy_file "features/google.feature"
      copy_file "cucumber.yml"
      copy_file ".rubocop.yml"
      copy_file ".ruby-version"
      copy_file ".travis.yml"
      copy_file ".relish"
      copy_file ".yard.yml"
      copy_file "browser.json"
      copy_file "package.json"
      copy_file "README.md"
      copy_file "ci_script"
      copy_file "features/support/env.rb"
      copy_file "features/support/hooks.rb"
      copy_file "features/support/responsive.rb"
      copy_file "features/pages/HomePage.rb"
      copy_file "features/pages/Abstract.rb"
      template "features/support/helpers.erb", "features/support/helpers.rb"
      init_gitignore
      append_file ".gitignore", ".ruby-version\n"
      append_file ".gitignore", ".travis.yml\n"
    end

    desc "fire_rspec", "Set up rspec"
    def fire_rspec
      genarate_gemfile
      insert_gem 'rspec'
      generate_rakefile
      add_task BDDfire::Tasks.rspec
      copy_file "spec/spec_helper.rb"
    end
    
    desc "generate_yard", "Set up Yard"
    def generate_yard
      genarate_gemfile
      insert_gem 'yard'
      
      generate_rakefile
      add_task BDDfire::Tasks.yard(project_name)

      init_gitignore
      append_file ".gitignore", "doc/*\n"
      append_file ".gitignore", ".yardoc\n"
    end
    
    private
    
    def project_name
      destination_root.split(/\/|\\/).last
    end
    
    def genarate_gemfile
      unless destination_file_exists?("Gemfile")
        add_file "Gemfile"
        append_file "Gemfile" do
          "source 'http://rubygems.org'\n\n" +
          "gem 'rake'\n"
          "gem 'rubocop-checkstyle_formatter', require: false \n\n"
        end
      end
    end

    def generate_rakefile
      unless destination_file_exists?("Rakefile")
        add_file "Rakefile"
        append_file "Rakefile" do
          "require 'rubygems'\n" +
          "require 'bundler'\n" +
          "require 'bundler/setup'\n\n"
        end
      end
    end
    
    def init_gitignore
      add_file ".gitignore" unless destination_file_exists?(".gitignore")
      ensure_eof_newline(".gitignore")
    end
    
    def destination_file_exists?(filename)
      File.exist?(File.join(destination_root, filename))
    end
    
    def insert_gem(gem_name)
      ensure_eof_newline("Gemfile")
      append_file "Gemfile", "gem '#{gem_name}'\n"
    end
    
    def add_task(the_task)
      append_file "Rakefile", "\n\n#{the_task}\n"
    end
    
    def ensure_eof_newline(filename)
      gsub_file(filename, /([^\n])\z/, "\\1\n")
    end
  end
end
