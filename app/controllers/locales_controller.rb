module JqueryLocalizationEngine
  class LocalesController < ::ApplicationController
    def locale
      logger.debug "jquery-localize for #{params[:locale]}"
      locale = params[:locale].to_sym
      respond_to do |format|
        format.js { render json: I18n.backend.send(:translations)[locale].to_json }
      end
    end
  end
end