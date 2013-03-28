module RailsAssetLocalization
  class LocalesController < ::ApplicationController
    respond_to :json

    def locale
      locale = params.fetch(:locale) { I18n.default_locale.to_s }
      locale = $1 if locale =~ /(\w+)\-(\w+)/

      I18n.backend.send(:init_translations)

      respond_with (I18n.backend.send(:translations)[locale.to_sym] || {}).to_json
    end
  end
end