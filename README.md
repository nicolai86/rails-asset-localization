# RailsAssetLocalization

A Rails Engine that allows you to use i18next with the asset pipeline. Locales are served dynamically to allow easy integration with services like [CopyCopter][1].

## Basic Setup

Add this to your `Gemfile`:

    gem 'rails-asset-localization', git: 'git@github.com:nicolai86/rails-asset-localization.git', branch: :master

Your locales are now available under `/locales/:locale`

Now you need to configure I18next:

``` coffeescript
# inside your application.coffee
#= require i18next.min # or i18next for development version
```

``` coffeescript
# inside your app startup code
locale = "de"
i18n.init({
  # change default interpolation from __VARIABLE__ to rails-style %{VARIABLE}
  interpolationPrefix: '%{'
  interpolationSuffix: '}'

  # current locale to load
  lng: locale

  # rails-asset-localization path
  resGetPath: 'locales/%{lng}.json'

  # store locales for 1 day in localStorage
  useLocalStorage: true
  localStorageExpirationTime: 60 * 60 * 24 * 1000
})
```

Now you can use it everywhere in your asset pipeline - see [i18next dokumentation][2] for details.

## Advanced Setup

To allow instant access to your locales you can include them into your compiled assets:

``` coffeescript
# inside your application.coffee
#= require i18next.min
#= require i18n/translations
...
for bundledLocale of bundledLocales
  storedLocale = window.localStorage.getItem("res_#{bundledLocale}")?
  unless storedLocale?
    object = {}
    object[bundledLocale] = bundledLocales[bundledLocale]
    i18n.sync._storeLocal object
```

Your locales are exported to the `window.bundledLocales` variable, which is used to populate the `localStorage` if not already present. The next time your `localStorageExpirationTime` kicks in the locales will be replaced by i18next.

## HandlebarsAsset integration

If you are using @leshill s [handlebars_assets][3] you might want to use a handlebars helper function to use it inside your views.
This will get you started:

``` coffeescript
Handlebars.registerHelper 't', ->
  args = [].slice.call(arguments)
  result = i18n.t.apply(i18n,args)
  return new Handlebars.SafeString(result)

# inside your views

{{t "app.hello", name: "Max Mustermann"}} # => Hello %{name} -> Hello Max Mustermann
```

[1]:https://github.com/copycopter/copycopter-server
[2]:http://i18next.com/
[3]:https://github.com/leshill/handlebars_assets