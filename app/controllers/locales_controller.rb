class LocalesController < ::ApplicationController
  def locale
    locale = params.fetch(:locale) { I18n.default_locale.to_s }
    locale = $1 if locale =~ /(\w+)\-(\w+)/

    respond_to do |format|
      format.js { render json: I18n.backend.send(:translations)[locale.to_sym].to_json }
      format.json { render json: I18n.backend.send(:translations)[locale.to_sym].to_json }
    end
  end
end