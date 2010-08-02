require 'test_helper'

class PathsControllerTest < ActionController::TestCase
  setup do
    @path = paths(:one)
    @layer = @path.layer
  end

  test "should get new" do
    get :new, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should create path" do
    assert_difference('Path.count') do
      post :create, :path => @path.attributes, :layer_id => @layer.to_param
    end

    assert_redirected_to layer_path_path(@layer, assigns(:path))
  end

  test "should show path" do
    get :show, :id => @path.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @path.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should update path" do
    put :update, :id => @path.to_param, :path => @path.attributes, :layer_id => @layer.to_param
    assert_redirected_to layer_path_path(@layer, assigns(:path))
  end

  test "should destroy path" do
    assert_difference('Path.count', -1) do
      delete :destroy, :id => @path.to_param, :layer_id => @layer.to_param
    end

    assert_redirected_to layer_path
  end
end
