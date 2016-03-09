require 'rubygems'
require 'bundler'
require 'yard'
require 'bundler/setup'

Bundler::GemHelper.install_tasks

# Cucumber tasks
require 'cucumber/rake/task'
YARD::Rake::YardocTask.new(:yard) do |t|
  t.files = ['features/**/*.feature', 'features/**/*.rb']
  # t.options = ['--any', '--extra', '--opts'] # optional
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = 'features --format pretty'
end

task default: [:features]
