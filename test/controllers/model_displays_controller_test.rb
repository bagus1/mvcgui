require 'test_helper'

class ModelDisplaysControllerTest < ActionController::TestCase
  setup do
    @model_display = model_displays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_displays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_display" do
    assert_difference('ModelDisplay.count') do
      post :create, model_display: { header: @model_display.header, modelid: @model_display.modelid, format: @model_display.format, action: @model_display.action }
    end

    assert_redirected_to model_display_path(assigns(:model_display))
  end

  test "should show model_display" do
    get :show, id: @model_display
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_display
    assert_response :success
  end

  test "should update model_display" do
    patch :update, id: @model_display, model_display: { header: @model_display.header, modelid: @model_display.modelid, format: @model_display.format, action: @model_display.action }
    assert_redirected_to model_display_path(assigns(:model_display))
  end

  test "should destroy model_display" do
    assert_difference('ModelDisplay.count', -1) do
      delete :destroy, id: @model_display
    end

    assert_redirected_to model_displays_path
  end
end
