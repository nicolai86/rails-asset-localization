module RailsAssetLocalization
  class LocalesController < ::ApplicationController
    respond_to :json

    def locale
      locale = params.fetch(:locale) { I18n.default_locale.to_s }
      locale = $1 if locale =~ /(\w+)\-(\w+)/
      locales = (locales_exporter.translations[locale.to_sym] || {})
      respond_with locales
    end

    def locales_exporter
      @@locales_exporter ||= ::RailsAssetLocalization::LocalesExporter.new
      @@locales_exporter
    end
  end
end