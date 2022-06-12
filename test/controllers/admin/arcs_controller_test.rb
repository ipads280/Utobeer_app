require "test_helper"

class Admin::ArcsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_arcs_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_arcs_index_url
    assert_response :success
  end
end
