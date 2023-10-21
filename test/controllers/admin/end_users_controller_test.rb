require "test_helper"

class Admin::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_end_users_index_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get admin_end_users_unsubscribe_url
    assert_response :success
  end
end
