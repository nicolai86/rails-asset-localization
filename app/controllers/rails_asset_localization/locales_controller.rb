module RailsAssetLocalization
  class LocalesController < ::ApplicationController
    respond_to :json

    def locale
      locale = params.fetch(:locale) { I18n.default_locale.to_s }
      locale = $1 if locale =~ /(\w+)\-(\w+)/

      locales_exporter = ::RailsAssetLocalization::LocalesExporter.new
      respond_with (locales_exporter.translations[locale.to_sym] || {}).to_json
    end
  end
end