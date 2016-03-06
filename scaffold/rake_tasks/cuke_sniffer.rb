task :cuke_sniffer do
  sh 'cd features'
  sh 'bundle exec cuke_sniffer'
end
