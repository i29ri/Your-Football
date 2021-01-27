require 'test_helper'

class PreviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get previews_show_url
    assert_response :success
  end

  test "should get edit" do
    get previews_edit_url
    assert_response :success
  end

  test "should get new" do
    get previews_new_url
    assert_response :success
  end
end
