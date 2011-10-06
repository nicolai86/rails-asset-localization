$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jquery-localization-engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jquery-localization-engine"
  s.version     = JqueryLocalizationEngine::VERSION
  s.authors     = ["Raphael Randschau"]
  s.email       = ["nicolai86@me.com"]
  s.homepage    = "http://nicolai86.eu"
  s.summary     = "jquery-localize locales engine"
  s.description = "jquery-localize locales engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.0"
end
