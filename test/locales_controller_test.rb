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
end