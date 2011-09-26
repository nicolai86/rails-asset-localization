module JqueryLocalizationEngine
  class LocalesController < ::ApplicationController
    def locale
      logger.debug "jquery-localize for #{params[:locale]}"
    end
  end
end