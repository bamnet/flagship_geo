require 'test_helper'

class PointsControllerTest < ActionController::TestCase
  setup do
    @point = points(:one)
    @layer = @point.layer
  end

  test "should get new" do
    get :new, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should create point" do
    assert_difference('Point.count') do
      post :create, :layer_id => @layer.to_param, :point => @point.attributes
    end

    assert_redirected_to layer_point_path(@layer, assigns(:point))
  end

  test "should show point" do
    get :show, :id => @point.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @point.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should update point" do
    put :update, :id => @point.to_param, :layer_id => @layer.to_param, :point => @point.attributes
    assert_redirected_to layer_point_path(assigns(:point))
  end

  test "should destroy point" do
    assert_difference('Point.count', -1) do
      delete :destroy, :id => @point.to_param, :layer_id => @layer.to_param
    end

    assert_redirected_to layer_path
  end
end
