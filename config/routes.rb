Rails.application.routes.draw do
  get "locales" => "jquery_localization_engine/locales#index" , :as => :locales
end
