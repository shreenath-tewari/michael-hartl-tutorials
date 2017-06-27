require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference User.count do
      post users_path, params: { user: { name: " ", email: "EXAMPLE>>Acom.@", password: "foo", password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select '<div class="alert alert-danger">'
  end

  test "valid signup information" do
    get signup_path
    assert_difference User.count, 1 do
      post users_path, params: { user: { name: "Example", email: "example@user.com", password: "123456", password_confirmation: "123456" } }
    end
    assert_template 'users/show'
    assert_select '<div class="alert alert-danger">'
  end

end
