Rails.application.routes.draw do
  match '/locales/:locale', to: 'jquery_localization_engine/locales#locale', via: :get, as: :locales
end
