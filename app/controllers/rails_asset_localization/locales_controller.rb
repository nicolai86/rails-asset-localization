module RailsAssetLocalization
  class LocalesController < ::ApplicationController
    respond_to :json

    def locale
      locale = params.fetch(:locale) { I18n.default_locale.to_s }
      country_locale = $1 if locale =~ /(\w+)\-(\w+)/

      locales_exporter = ::RailsAssetLocalization::LocalesExporter.new
      locales = (locales_exporter.translations[locale] || locales_exporter.translations[country_locale] || {})
      respond_with locales
    end
  end
end