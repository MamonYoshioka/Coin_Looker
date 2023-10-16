require "test_helper"

class Admin::PostScriptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_scripts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_scripts_show_url
    assert_response :success
  end
end
