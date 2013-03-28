$:.push File.expand_path("../lib", __FILE__)

require "rails_asset_localization/version"

Gem::Specification.new do |s|
  s.name        = "rails-asset-localization"
  s.version     = RailsAssetLocalization::VERSION
  s.authors     = ["Raphael Randschau"]
  s.email       = ["nicolai86@me.com"]
  s.homepage    = "http://nicolai86.eu"
  s.summary     = "rails-asset-localization"
  s.description = "rails-asset-localization"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_dependency "tilt"
end
