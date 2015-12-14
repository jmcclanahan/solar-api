require 'test_helper'

class LobsControllerTest < ActionController::TestCase
  setup do
    @lob = lobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lobs)
  end

  test "should create lob" do
    assert_difference('Lob.count') do
      post :create, lob: { company_authority_id: @lob.company_authority_id, effective_date: @lob.effective_date, line_type_id: @lob.line_type_id, termination_date: @lob.termination_date }
    end

    assert_response 201
  end

  test "should show lob" do
    get :show, id: @lob
    assert_response :success
  end

  test "should update lob" do
    put :update, id: @lob, lob: { company_authority_id: @lob.company_authority_id, effective_date: @lob.effective_date, line_type_id: @lob.line_type_id, termination_date: @lob.termination_date }
    assert_response 204
  end

  test "should destroy lob" do
    assert_difference('Lob.count', -1) do
      delete :destroy, id: @lob
    end

    assert_response 204
  end
end
