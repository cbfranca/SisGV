require 'test_helper'

class BenfeitoresControllerTest < ActionController::TestCase
  setup do
    @benfeitor = benfeitores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benfeitores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benfeitor" do
    assert_difference('Benfeitor.count') do
      post :create, benfeitor: {  }
    end

    assert_redirected_to benfeitor_path(assigns(:benfeitor))
  end

  test "should show benfeitor" do
    get :show, id: @benfeitor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @benfeitor
    assert_response :success
  end

  test "should update benfeitor" do
    put :update, id: @benfeitor, benfeitor: {  }
    assert_redirected_to benfeitor_path(assigns(:benfeitor))
  end

  test "should destroy benfeitor" do
    assert_difference('Benfeitor.count', -1) do
      delete :destroy, id: @benfeitor
    end

    assert_redirected_to benfeitores_path
  end
end
