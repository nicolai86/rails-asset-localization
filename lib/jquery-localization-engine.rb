module JqueryLocalizationEngine
  def self.setup
    yield self
  end
end

require 'jquery-localization-engine/engine'
require 'jquery-localization-engine/haml_assets'