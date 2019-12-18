#!/usr/bin/env rake
begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)

load "rails/tasks/engine.rake"
load "rails/tasks/statistics.rake"
load 'workarea/changelog.rake'
require "rake/testtask"

# Run all tests
Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_test.rb"
  t.verbose = false
  t.warning = false
end

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "workarea/facebook_login/version"

desc "Release version #{Workarea::FacebookLogin::VERSION} of the gem"
task :release do
  host = "https://#{ENV['BUNDLE_GEMS__WEBLINC__COM']}@gems.weblinc.com"

  Rake::Task['workarea:changelog'].execute
  system 'git add CHANGELOG.md'
  system 'git commit -m "Update CHANGELOG"'
  system 'git push origin HEAD'

  system "git tag -a v#{Workarea::FacebookLogin::VERSION} -m 'Tagging #{Workarea::FacebookLogin::VERSION}'"
  system "git push --tags"

  system "gem build workarea-facebook_login.gemspec"
  system "gem push workarea-facebook_login-#{Workarea::FacebookLogin::VERSION}.gem #{host}"
  system "gem push workarea-facebook_login-#{Workarea::FacebookLogin::VERSION}.gem --host #{host}"
  system "rm workarea-facebook_login-#{Workarea::FacebookLogin::VERSION}.gem"
end
