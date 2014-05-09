require 'test_helper'

class TextboxesControllerTest < ActionController::TestCase
  setup do
    @textbox = textboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:textboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create textbox" do
    assert_difference('Textbox.count') do
      post :create, textbox: { attributeDisplayId: @textbox.attributeDisplayId, size: @textbox.size }
    end

    assert_redirected_to textbox_path(assigns(:textbox))
  end

  test "should show textbox" do
    get :show, id: @textbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @textbox
    assert_response :success
  end

  test "should update textbox" do
    patch :update, id: @textbox, textbox: { attributeDisplayId: @textbox.attributeDisplayId, size: @textbox.size }
    assert_redirected_to textbox_path(assigns(:textbox))
  end

  test "should destroy textbox" do
    assert_difference('Textbox.count', -1) do
      delete :destroy, id: @textbox
    end

    assert_redirected_to textboxes_path
  end
end
