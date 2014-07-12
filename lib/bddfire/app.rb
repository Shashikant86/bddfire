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
    
    desc "cucumber", "Set up cucumber"
    def cucumber
      genarate_gemfile
      insert_gem 'cucumber'
      insert_gem 'capybara'
      insert_gem 'selenium-webdriver'
      insert_gem 'poltergeist'
      generate_rakefile
      add_task BDDfire::Tasks.cucumber
      add_file "features/step_definitions/#{project_name}_steps.rb"
      add_file "features/#{project_name}.feature"
      add_file "cucumber.yml"
      add_file ".rubocop.yml"
      add_file ".relish"
      add_file ".ruby-version"
      add_file ".travis.yml"
      copy_file "features/support/env.rb"
      copy_file "features/support/hooks.rb"
      template "features/support/helpers.erb", "features/support/helpers.rb"
      init_gitignore
      append_file ".gitignore", ".ruby-version\n"
      append_file ".gitignore", ".travis.yml\n"
    end

    desc "rspec", "Set up rspec"
    def rspec
      genarate_gemfile
      insert_gem 'rspec'
      generate_rakefile
      add_task BDDfire::Tasks.rspec
      copy_file "spec/spec_helper.rb"
    end
    
    desc "yard", "Set up Yard"
    def yard
      genarate_gemfile
      insert_gem 'yard'
      
      generate_rakefile
      add_task BDDfire::Tasks.yard(project_name)

      init_gitignore
      append_file ".gitignore", "doc/*\n"
      append_file ".gitignore", ".yardoc\n"
    end
    
    desc "cuke_sniffer", "Set up cuke_sniffer"
    def cuke_sniffer
      genarate_gemfile
      insert_gem 'cuke_sniffer'
      
      generate_rakefile
      add_task BDDfire::Tasks.cuke_sniffer
    end
   
    desc "rubocop", "Set up rubocop"
    def cuke_sniffer
      genarate_gemfile
      insert_gem 'rubocop'
      
      generate_rakefile
      add_task BDDfire::Tasks.rubocop
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