require 'rspec/core/rake_task'
desc 'Run specs'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--color)
end
namespace :spec do
  desc 'Run specs with output in documentation format'
  RSpec::Core::RakeTask.new(:doc) do |t|
    t.rspec_opts = ['--color', '--format d']
  end
end
