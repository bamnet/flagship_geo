require 'test_helper'

class PolygonsControllerTest < ActionController::TestCase
  setup do
    @polygon = polygons(:one)
    @layer = @polygon.layer
  end

  test "should get new" do
    get :new, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should create polygon" do
    assert_difference('Polygon.count') do
      post :create, :layer_id => @layer.to_param, :polygon => @polygon.attributes
    end

    assert_redirected_to layer_polygon_path(@layer, assigns(:polygon))
  end

  test "should show polygon" do
    get :show, :id => @polygon.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @polygon.to_param, :layer_id => @layer.to_param
    assert_response :success
  end

  test "should update polygon" do
    put :update, :id => @polygon.to_param, :layer_id => @layer.to_param, :polygon => @polygon.attributes
    assert_redirected_to layer_polygon_path(assigns(:polygon))
  end

  test "should destroy polygon" do
    assert_difference('Polygon.count', -1) do
      delete :destroy, :id => @polygon.to_param, :layer_id => @layer.to_param
    end

    assert_redirected_to layer_path
  end
end
