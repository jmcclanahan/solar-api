require 'test_helper'

class DomicileTypesControllerTest < ActionController::TestCase
  setup do
    @domicile_type = domicile_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domicile_types)
  end

  test "should create domicile_type" do
    assert_difference('DomicileType.count') do
      post :create, domicile_type: { domicile_type_code: @domicile_type.domicile_type_code, domicile_type_desc: @domicile_type.domicile_type_desc, state_id: @domicile_type.state_id }
    end

    assert_response 201
  end

  test "should show domicile_type" do
    get :show, id: @domicile_type
    assert_response :success
  end

  test "should update domicile_type" do
    put :update, id: @domicile_type, domicile_type: { domicile_type_code: @domicile_type.domicile_type_code, domicile_type_desc: @domicile_type.domicile_type_desc, state_id: @domicile_type.state_id }
    assert_response 204
  end

  test "should destroy domicile_type" do
    assert_difference('DomicileType.count', -1) do
      delete :destroy, id: @domicile_type
    end

    assert_response 204
  end
end
