require 'test_helper'

class FormatFormsControllerTest < ActionController::TestCase
  setup do
    @format_form = format_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:format_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create format_form" do
    assert_difference('FormatForm.count') do
      post :create, format_form: { description: @format_form.description, public: @format_form.public, title: @format_form.title }
    end

    assert_redirected_to format_form_path(assigns(:format_form))
  end

  test "should show format_form" do
    get :show, id: @format_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @format_form
    assert_response :success
  end

  test "should update format_form" do
    patch :update, id: @format_form, format_form: { description: @format_form.description, public: @format_form.public, title: @format_form.title }
    assert_redirected_to format_form_path(assigns(:format_form))
  end

  test "should destroy format_form" do
    assert_difference('FormatForm.count', -1) do
      delete :destroy, id: @format_form
    end

    assert_redirected_to format_forms_path
  end
end
