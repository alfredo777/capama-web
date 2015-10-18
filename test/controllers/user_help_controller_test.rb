require 'test_helper'

class UserHelpControllerTest < ActionController::TestCase
  test "should get new_ticket" do
    get :new_ticket
    assert_response :success
  end

  test "should get new_customer" do
    get :new_customer
    assert_response :success
  end

  test "should get chat" do
    get :chat
    assert_response :success
  end

end
