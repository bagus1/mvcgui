require 'test_helper'

class TextreadsControllerTest < ActionController::TestCase
  setup do
    @textread = textreads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:textreads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create textread" do
    assert_difference('Textread.count') do
      post :create, textread: { attributeDisplayId: @textread.attributeDisplayId, transformation: @textread.transformation, truncation: @textread.truncation, truncation_format: @textread.truncation_format }
    end

    assert_redirected_to textread_path(assigns(:textread))
  end

  test "should show textread" do
    get :show, id: @textread
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @textread
    assert_response :success
  end

  test "should update textread" do
    patch :update, id: @textread, textread: { attributeDisplayId: @textread.attributeDisplayId, transformation: @textread.transformation, truncation: @textread.truncation, truncation_format: @textread.truncation_format }
    assert_redirected_to textread_path(assigns(:textread))
  end

  test "should destroy textread" do
    assert_difference('Textread.count', -1) do
      delete :destroy, id: @textread
    end

    assert_redirected_to textreads_path
  end
end
