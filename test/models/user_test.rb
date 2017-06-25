require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "example@example.com", password: "123456", password_confirmation: "123456")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be more than 50 characters" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be more than 255 characters" do
    @user.email = ("a" * 250) + "@example.com"
    assert_not @user.valid?
  end

  test "email should be unique" do
    @duplicate_user = @user.dup
    @duplicate_user.email = @user.email.upcase
    @user.save
    assert_not @duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should be of minimum length" do
    @user.password = @user.password_confirmation = "a" * 4
    assert_not @user.valid?
  end
  
end
