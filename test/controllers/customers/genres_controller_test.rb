require 'test_helper'

class Customers::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get customers_genres_search_url
    assert_response :success
  end

end
