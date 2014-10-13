require 'rubygems'
gemfile = File.expand_path('../../../../Gemfile', __FILE__)

# Set up gems listed in the the Gemfile
ENV['BUNDLE_GEMFILE'] ||= File.expand.path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
