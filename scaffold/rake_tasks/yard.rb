require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb', '-', 'CHANGELOG', 'LICENSE']
  t.options = ['--no-private', '--title', '{{project_name}} API Documentation']
end
