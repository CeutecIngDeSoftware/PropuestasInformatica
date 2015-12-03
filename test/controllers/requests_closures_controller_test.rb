require 'test_helper'

class RequestsClosuresControllerTest < ActionController::TestCase
  setup do
    @requests_closure = requests_closures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_closures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_closure" do
    assert_difference('RequestsClosure.count') do
      post :create, requests_closure: { career_id: @requests_closure.career_id, final_date: @requests_closure.final_date }
    end

    assert_redirected_to requests_closure_path(assigns(:requests_closure))
  end

  test "should show requests_closure" do
    get :show, id: @requests_closure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_closure
    assert_response :success
  end

  test "should update requests_closure" do
    patch :update, id: @requests_closure, requests_closure: { career_id: @requests_closure.career_id, final_date: @requests_closure.final_date }
    assert_redirected_to requests_closure_path(assigns(:requests_closure))
  end

  test "should destroy requests_closure" do
    assert_difference('RequestsClosure.count', -1) do
      delete :destroy, id: @requests_closure
    end

    assert_redirected_to requests_closures_path
  end
end
