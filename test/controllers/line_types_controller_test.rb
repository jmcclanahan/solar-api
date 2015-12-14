require 'test_helper'

class LineTypesControllerTest < ActionController::TestCase
  setup do
    @line_type = line_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_types)
  end

  test "should create line_type" do
    assert_difference('LineType.count') do
      post :create, line_type: { line_type_code: @line_type.line_type_code, line_type_desc: @line_type.line_type_desc, state_id: @line_type.state_id }
    end

    assert_response 201
  end

  test "should show line_type" do
    get :show, id: @line_type
    assert_response :success
  end

  test "should update line_type" do
    put :update, id: @line_type, line_type: { line_type_code: @line_type.line_type_code, line_type_desc: @line_type.line_type_desc, state_id: @line_type.state_id }
    assert_response 204
  end

  test "should destroy line_type" do
    assert_difference('LineType.count', -1) do
      delete :destroy, id: @line_type
    end

    assert_response 204
  end
end
