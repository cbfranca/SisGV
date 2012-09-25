require 'test_helper'

class VocacionadasControllerTest < ActionController::TestCase
  setup do
    @vocacionada = vocacionadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocacionadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocacionada" do
    assert_difference('Vocacionada.count') do
      post :create, vocacionada: {  }
    end

    assert_redirected_to vocacionada_path(assigns(:vocacionada))
  end

  test "should show vocacionada" do
    get :show, id: @vocacionada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vocacionada
    assert_response :success
  end

  test "should update vocacionada" do
    put :update, id: @vocacionada, vocacionada: {  }
    assert_redirected_to vocacionada_path(assigns(:vocacionada))
  end

  test "should destroy vocacionada" do
    assert_difference('Vocacionada.count', -1) do
      delete :destroy, id: @vocacionada
    end

    assert_redirected_to vocacionadas_path
  end
end
