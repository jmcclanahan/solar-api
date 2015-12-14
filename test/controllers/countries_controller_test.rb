require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  setup do
    @country = countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should create country" do
    assert_difference('Country.count') do
      post :create, country: { country_code: @country.country_code, country_desc: @country.country_desc }
    end

    assert_response 201
  end

  test "should show country" do
    get :show, id: @country
    assert_response :success
  end

  test "should update country" do
    put :update, id: @country, country: { country_code: @country.country_code, country_desc: @country.country_desc }
    assert_response 204
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete :destroy, id: @country
    end

    assert_response 204
  end
end
