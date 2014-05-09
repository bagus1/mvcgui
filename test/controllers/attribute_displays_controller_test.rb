require 'test_helper'

class AttributeDisplaysControllerTest < ActionController::TestCase
  setup do
    @attribute_display = attribute_displays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribute_displays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attribute_display" do
    assert_difference('AttributeDisplay.count') do
      post :create, attribute_display: { action: @attribute_display.action, attributeid: @attribute_display.attributeid, format: @attribute_display.format, header: @attribute_display.header }
    end

    assert_redirected_to attribute_display_path(assigns(:attribute_display))
  end

  test "should show attribute_display" do
    get :show, id: @attribute_display
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attribute_display
    assert_response :success
  end

  test "should update attribute_display" do
    patch :update, id: @attribute_display, attribute_display: { action: @attribute_display.action, attributeid: @attribute_display.attributeid, format: @attribute_display.format, header: @attribute_display.header }
    assert_redirected_to attribute_display_path(assigns(:attribute_display))
  end

  test "should destroy attribute_display" do
    assert_difference('AttributeDisplay.count', -1) do
      delete :destroy, id: @attribute_display
    end

    assert_redirected_to attribute_displays_path
  end
end
