require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files = ['features/**/*.feature', 'features/**/*.rb']
  t.options = ['--any', '--extra', '--opts'] # optional
end

task :yard_bundle do
  sh "bundle exec yardoc 'example/**/*.rb' 'example/**/*.feature'"
end
