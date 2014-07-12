require 'rubocop/rake_task'

desc "Run Rubocop"

Rubocop::RakeTask.new(:rubocop) do |task|
	task.patterns = ['features/**/*.rb']
end
	
