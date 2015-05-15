# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require "#{File.dirname(__FILE__)}/dummy/config/environment"
require 'weblinc/testing/spec_helper'
require 'weblinc/testing/store_front_spec_helper'

RSpec.configure do |config|
  config.mock_with :rspec

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end
