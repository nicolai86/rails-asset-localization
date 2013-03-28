module HamlAssets
  class HamlSprocketsEngine < Tilt::Template
    protected
    def view_context(scope)
      @view_context ||=
        context_class(scope).new(
          scope.environment,
          scope.logical_path.to_s,
          scope.pathname).tap { |ctx|
            ctx.class.send(:include, ViewContext)

            ctx.instance_eval do
              def translate key, options = {}
                trans = I18n.translate key, options
                content_tag(:span, trans, rel: "localize[#{key}]")
              end

              alias :t :translate
            end

          }
    end
  end
end