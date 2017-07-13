$:.push File.expand_path("../lib", __FILE__)

require "workarea/facebook_login/version"

Gem::Specification.new do |s|
  s.name        = "workarea-facebook_login"
  s.version     = Workarea::FacebookLogin::VERSION
  s.authors     = ["Eric Pigeon"]
  s.email       = ["epigeon@workarea.com"]
  s.homepage    = "https://stash.tools.weblinc.com/projects/WP/repos/workarea-facebook-login/browse"
  s.summary     = "Facebook Login plugin for the Workarea ecommerce platform"
  s.description = "Plugin for sign in with Facebook on the Workarea ecommerce platform."

  s.files = `git ls-files`.split("\n")

  s.required_ruby_version = ">= 2.0.0"

  s.add_dependency "omniauth-facebook", "~> 4.0"
  s.add_dependency "workarea",          "~> 3.x", ">= 3.0.6"
end
