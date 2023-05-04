require "test_helper"

class SeachesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get seaches_search_url
    assert_response :success
  end
end
