require 'test_helper'

class PublicViewsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get procedures_and_services" do
    get :procedures_and_services
    assert_response :success
  end

  test "should get whater_culture" do
    get :whater_culture
    assert_response :success
  end

  test "should get citizen_management" do
    get :citizen_management
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get transparency" do
    get :transparency
    assert_response :success
  end

  test "should get about_acapulco" do
    get :about_acapulco
    assert_response :success
  end

  test "should get infraestructure" do
    get :infraestructure
    assert_response :success
  end

end
