#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rspec/core/rake_task'
#require 'ci/reporter/rake/rspec'
RSpec::Core::RakeTask.new :test

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'weblinc/facebook/version'

desc "Release version #{Weblinc::Facebook::VERSION} of the gem"
task :release do
  host = "https://#{ENV['BUNDLE_GEMS__WEBLINC__COM']}@gems.weblinc.com"

  system "git tag -a v#{Weblinc::Facebook::VERSION} -m 'Tagging #{Weblinc::Facebook::VERSION}'"
  system 'git push --tags'

  system "gem build weblinc-facebook.gemspec"
  system "gem push weblinc-facebook-#{Weblinc::Facebook::VERSION}.gem --host #{host}"
  system "rm weblinc-facebook-#{Weblinc::Facebook::VERSION}.gem"
end
