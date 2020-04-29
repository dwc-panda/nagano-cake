require 'test_helper'

class Customers::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_end_users_index_url
    assert_response :success
  end

end
