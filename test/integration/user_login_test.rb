require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "invalid user login" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: " ", password: " " } }
    assert_template 'session/new'
    assert_not flash.empty?
    get root_url
    assert flash.empty?
  end

end
