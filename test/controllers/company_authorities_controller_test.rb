require 'test_helper'

class CompanyAuthoritiesControllerTest < ActionController::TestCase
  setup do
    @company_authority = company_authorities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_authorities)
  end

  test "should create company_authority" do
    assert_difference('CompanyAuthority.count') do
      post :create, company_authority: { company_id: @company_authority.company_id, company_type_id: @company_authority.company_type_id, effective_date: @company_authority.effective_date, expiration_date: @company_authority.expiration_date, issue_date: @company_authority.issue_date }
    end

    assert_response 201
  end

  test "should show company_authority" do
    get :show, id: @company_authority
    assert_response :success
  end

  test "should update company_authority" do
    put :update, id: @company_authority, company_authority: { company_id: @company_authority.company_id, company_type_id: @company_authority.company_type_id, effective_date: @company_authority.effective_date, expiration_date: @company_authority.expiration_date, issue_date: @company_authority.issue_date }
    assert_response 204
  end

  test "should destroy company_authority" do
    assert_difference('CompanyAuthority.count', -1) do
      delete :destroy, id: @company_authority
    end

    assert_response 204
  end
end
