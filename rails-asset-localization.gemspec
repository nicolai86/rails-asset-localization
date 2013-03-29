$:.push File.expand_path("../lib", __FILE__)

require "rails_asset_localization/version"

Gem::Specification.new do |s|
  s.name        = "rails-asset-localization"
  s.version     = RailsAssetLocalization::VERSION
  s.authors     = ["Raphael Randschau"]
  s.email       = ["nicolai86@me.com"]
  s.homepage    = "http://nicolai86.eu"
  s.summary     = "I18next and dynamic localization for your Rails app"
  s.description = "I18next and dynamic localization for your Rails app"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
end
