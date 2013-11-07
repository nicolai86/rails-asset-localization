class Sprockets::DirectiveProcessor
  def process_depend_on_locales_directive
    Dir.glob("#{Rails.root}/config/locales/**.yml").each do |path|
      context.depend_on(path)
    end
  end
end
