require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get card" do
    get :card
    assert_response :success
  end

  test "should get resume" do
    get :resume
    assert_response :success
  end

  test "should get extra" do
    get :extra
    assert_response :success
  end

  test "should get account" do
    get :account
    assert_response :success
  end

end
