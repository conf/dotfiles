#!/usr/bin/env ruby
require 'English'

Dir["#{ENV['HOME']}/.ssh/*"].each do |path|
  next if !File.file?(path) || path =~ /known_hosts$/
  info = `ssh-keygen -l -f #{path} 2>&1`.split(' ')
  next unless $CHILD_STATUS.success?
  length = info[0].to_i
  algorithm = info[-1].gsub(/[()]/, '')
  print "#{path} ... "
  if (algorithm == 'RSA' && length >= 2048) ||
     (algorithm == 'ECDSA' && length == 521)
    puts 'strong'
  else
    puts 'weak'
  end
end
