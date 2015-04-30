$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weblinc/facebook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weblinc-facebook"
  s.version     = Weblinc::Facebook::VERSION
  s.authors     = ["Francisco Galarza"]
  s.email       = ["fgalarza@weblinc.com"]
  s.homepage    = "http://www.weblinc.com"
  s.summary     = "Facebook plugin for the WebLinc ecommerce platform"
  s.description = "Plugin for sign in with Facebook on the Weblinc ecommerce platform."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.rdoc"]

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'omniauth-facebook', '1.6.0'
  s.add_dependency 'weblinc', '~> 0.8.0'
end
