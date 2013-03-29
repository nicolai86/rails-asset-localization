module RailsAssetLocalization
  def self.setup
    yield self
  end
end

require 'rails_asset_localization/engine'
require 'rails_asset_localization/version'
require 'rails_asset_localization/locales_exporter'