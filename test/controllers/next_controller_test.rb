require "test_helper"

class NextControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get next_index_url
    assert_response :success
  end
end
