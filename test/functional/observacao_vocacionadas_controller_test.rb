require 'test_helper'

class ObservacaoVocacionadasControllerTest < ActionController::TestCase
  setup do
    @observacao_vocacionada = observacao_vocacionadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observacao_vocacionadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observacao_vocacionada" do
    assert_difference('ObservacaoVocacionada.count') do
      post :create, observacao_vocacionada: {  }
    end

    assert_redirected_to observacao_vocacionada_path(assigns(:observacao_vocacionada))
  end

  test "should show observacao_vocacionada" do
    get :show, id: @observacao_vocacionada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @observacao_vocacionada
    assert_response :success
  end

  test "should update observacao_vocacionada" do
    put :update, id: @observacao_vocacionada, observacao_vocacionada: {  }
    assert_redirected_to observacao_vocacionada_path(assigns(:observacao_vocacionada))
  end

  test "should destroy observacao_vocacionada" do
    assert_difference('ObservacaoVocacionada.count', -1) do
      delete :destroy, id: @observacao_vocacionada
    end

    assert_redirected_to observacao_vocacionadas_path
  end
end
