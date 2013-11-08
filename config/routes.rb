RailsAssetLocalization::Engine.routes.draw do
  match '/:locale', to: 'rails_asset_localization/locales#locale', via: :get, as: :locales
end