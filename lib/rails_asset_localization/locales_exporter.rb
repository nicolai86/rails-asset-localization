module RailsAssetLocalization
  class LocalesExporter
    def initialize
      I18n.backend.send(:init_translations)
    end

    def translations
      return @translations ||= HashWithIndifferentAccess.new(extract_translations)
    end

    private
    def extract_translations
      if defined?(CopycopterClient) && I18n.backend.is_a?(CopycopterClient::I18nBackend)
        YAML.load I18n.backend.send(:cache).export
      else
        I18n.backend.send(:translations)
      end
    rescue => e
      Rails.logger.warn e
      return ""
    end
  end
end