require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |features|
  features.cucumber_opts = 'features -p selenium --format progress'
end
Cucumber::Rake::Task.new(:features_ci) do |task|
  task.cucumber_opts = ['-p poltergeist -f pretty -f junit --out target/ -f html --out target/report.html']
end
