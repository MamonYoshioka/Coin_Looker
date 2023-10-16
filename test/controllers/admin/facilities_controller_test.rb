require "test_helper"

class Admin::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_facilities_index_url
    assert_response :success
  end
end
