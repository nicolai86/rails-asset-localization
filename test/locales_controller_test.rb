require 'test_helper'

class LocalesControllerTest < ActionDispatch::IntegrationTest
  test "returns assets via request" do
    get "/locales/de.json"
    assert_response :success

    locales = JSON.parse response.body
    assert_equal %w(hello), locales.keys
    assert_equal "Hallo Welt", locales["hello"]

    get "/locales/en.json"
    assert_response :success

    locales = JSON.parse response.body
    assert locales.keys.include?("hello")
    assert_equal "Hello world", locales["hello"]
  end

  test "returns empty hash for unknown locales" do
    get "/locales/fr.json"
    assert_response :success

    locales = JSON.parse response.body
    assert locales.empty?
  end

  test "works for country codes as well" do
    get "/locales/de-DE.json"
    locales = JSON.parse response.body
    assert_equal %w(hello), locales.keys
    assert_equal "Hallo Welt", locales["hello"]
  end

  test "works for existing country codes as well" do
    get "/locales/nl-BE.json"
    locales = JSON.parse response.body
    assert_equal %w(hello), locales.keys
    assert_equal "Hallo Wereld", locales["hello"]
  end
end