require "test_helper"

class CheckTextsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get check_texts_show_url
    assert_response :success
  end
end
