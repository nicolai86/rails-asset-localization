# JqueryLocalizationEngine

A Rails Engine that exports your I18n locales as json so you can use it with jQuery-localize and similar.

## Setup

In your Gemfile:

    gem 'jquery-localization-engine', git: 'http://github.com/leahpar/jquery-localization-engine.git'

That's it! Your locales are now available under `/locales/:locale`

## Todo

  - Specs
  - customizable routes
  - Maybe a Handlebars binding, so you can use it with the asset-pipeline! (Precompiling would be possible, too!)
