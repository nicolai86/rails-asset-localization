module JqueryLocalizationEngine
  module HamlAssets
    def translate(key, options = {})
      trans = I18n.t key, options
      content_tag(:span, trans, rel: "localize[#{key}]")
    end

    alias :t :translate
  end
end

module HamlAssets
  class HamlSprocketsEngine < Tilt::Template
    module ViewContext
      include ::ActionView::Helpers::TagHelper
      include ::JqueryLocalizationEngine::HamlAssets
    end
  end
end