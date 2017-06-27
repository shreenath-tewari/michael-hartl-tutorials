require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @title = "Sample App"
  end

  test "should get new" do
    get login_url
    assert_select "title", "Login | #{@title}"
    assert_response :success
  end

end
