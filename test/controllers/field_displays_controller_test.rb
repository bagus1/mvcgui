require 'test_helper'

class FieldDisplaysControllerTest < ActionController::TestCase
  setup do
    @field_display = field_displays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_displays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_display" do
    assert_difference('FieldDisplay.count') do
      post :create, field_display: { action: @field_display.action, attributeid: @field_display.attributeid, format: @field_display.format, header: @field_display.header }
    end

    assert_redirected_to field_display_path(assigns(:field_display))
  end

  test "should show field_display" do
    get :show, id: @field_display
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_display
    assert_response :success
  end

  test "should update field_display" do
    patch :update, id: @field_display, field_display: { action: @field_display.action, attributeid: @field_display.attributeid, format: @field_display.format, header: @field_display.header }
    assert_redirected_to field_display_path(assigns(:field_display))
  end

  test "should destroy field_display" do
    assert_difference('FieldDisplay.count', -1) do
      delete :destroy, id: @field_display
    end

    assert_redirected_to field_displays_path
  end
end
