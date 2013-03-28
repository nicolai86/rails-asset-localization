# JqueryLocalizationEngine

A Rails Engine that allows you to use i18next with your locales. Locales are served dynamically to allow easy integration with services like [CopyCopter][1].

## Example Setup

Add this to your `Gemfile`:

    gem 'rails-asset-localization', git: 'git@github.com:nicolai86/rails-asset-localization.git', branch: :master

Your locales are now available under `/locales/:locale`

Now you need to configure I18next:

``` coffeescript
# inside your application.coffee
#= require i18next.min
…
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

Now you can use it everywhere in your asset pipeline - see [i18next dokumentation][2] for details

## HandlebarsAsset integration

If you are using @leshill s [handlebars_assets][3] you might want to use a handlebars helper function to use it inside your views
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