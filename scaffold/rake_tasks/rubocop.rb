require 'rubocop/rake_task'

# desc "Run Rubocop"

# Rubocop::RakeTask.new(:rubocop_rake) do |task|
#	task.patterns = ['features/**/*.rb']
# end

task :rubocop do
  sh 'bundle exec rubocop'
end
