require 'test_helper'

class RecordsFormatsControllerTest < ActionController::TestCase
  setup do
    @records_format = records_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create records_format" do
    assert_difference('RecordsFormat.count') do
      post :create, records_format: { classname: @records_format.classname, name: @records_format.name, type: @records_format.type }
    end

    assert_redirected_to records_format_path(assigns(:records_format))
  end

  test "should show records_format" do
    get :show, id: @records_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @records_format
    assert_response :success
  end

  test "should update records_format" do
    patch :update, id: @records_format, records_format: { classname: @records_format.classname, name: @records_format.name, type: @records_format.type }
    assert_redirected_to records_format_path(assigns(:records_format))
  end

  test "should destroy records_format" do
    assert_difference('RecordsFormat.count', -1) do
      delete :destroy, id: @records_format
    end

    assert_redirected_to records_formats_path
  end
end
