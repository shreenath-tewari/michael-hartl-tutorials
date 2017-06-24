require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @title = "Sample App"
  end

  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | #{@title}"
  end

end
