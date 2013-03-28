Rails.application.routes.draw do
  match '/locales/:locale', to: 'rails_asset_localization/locales#locale', via: :get, as: :locales
end
