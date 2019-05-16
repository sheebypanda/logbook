require 'test_helper'

class SisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @si = sis(:one)
  end

  test "should get index" do
    get sis_url
    assert_response :success
  end

  test "should get new" do
    get new_si_url
    assert_response :success
  end

  test "should create si" do
    assert_difference('Si.count') do
      post sis_url, params: { si: { name: @si.name, trigram: @si.trigram } }
    end

    assert_redirected_to si_url(Si.last)
  end

  test "should show si" do
    get si_url(@si)
    assert_response :success
  end

  test "should get edit" do
    get edit_si_url(@si)
    assert_response :success
  end

  test "should update si" do
    patch si_url(@si), params: { si: { name: @si.name, trigram: @si.trigram } }
    assert_redirected_to si_url(@si)
  end

  test "should destroy si" do
    assert_difference('Si.count', -1) do
      delete si_url(@si)
    end

    assert_redirected_to sis_url
  end
end
