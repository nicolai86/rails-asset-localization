module JqueryLocalizationEngine
  class Engine < Rails::Engine
    initialize "jquery-localization.app" do |app|
      JqueryLocalizationEngine.setup do |config|
      end
    end
  end
end