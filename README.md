# JqueryLocalizationEngine

A Rails Engine that exports your I18n locales as json so you can use it with jQuery-localize and similar.

## Setup

In your Gemfile:

    gem 'jquery-localization-engine', git: 'http://github.com/leahpar/jquery-localization-engine.git'

That's it! Your locales are now available under `/locales/:locale`

## What it does

Your locales will be served as in JSON, and converted to define a Handlebars compatible binding.
E.g. `Welcome %{user}!` will be converted to `Welcome {{user}}!`

If you are using the haml\_asset gem you'll have access to a modified version of `I18n.t` which renders your localizations using the `I18n.default_locale`, and wraps the results into a span so you can later on use jQuery-localize to dynamically re-localize the entire page!

## Todo

  - Specs
  - customizable routes
  - Maybe a Handlebars binding, so you can use it with the asset-pipeline! (Precompiling would be possible, too!)
