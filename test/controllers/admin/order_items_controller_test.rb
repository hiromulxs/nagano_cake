require "test_helper"

class Admin::OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_order_items_edit_url
    assert_response :success
  end
end
