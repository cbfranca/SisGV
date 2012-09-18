require 'test_helper'

class ObservacaoVocacionadosControllerTest < ActionController::TestCase
  setup do
    @observacao_vocacionado = observacao_vocacionados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:observacao_vocacionados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create observacao_vocacionado" do
    assert_difference('ObservacaoVocacionado.count') do
      post :create, observacao_vocacionado: { data: @observacao_vocacionado.data, descricao: @observacao_vocacionado.descricao, vocacionado_id: @observacao_vocacionado.vocacionado_id }
    end

    assert_redirected_to observacao_vocacionado_path(assigns(:observacao_vocacionado))
  end

  test "should show observacao_vocacionado" do
    get :show, id: @observacao_vocacionado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @observacao_vocacionado
    assert_response :success
  end

  test "should update observacao_vocacionado" do
    put :update, id: @observacao_vocacionado, observacao_vocacionado: { data: @observacao_vocacionado.data, descricao: @observacao_vocacionado.descricao, vocacionado_id: @observacao_vocacionado.vocacionado_id }
    assert_redirected_to observacao_vocacionado_path(assigns(:observacao_vocacionado))
  end

  test "should destroy observacao_vocacionado" do
    assert_difference('ObservacaoVocacionado.count', -1) do
      delete :destroy, id: @observacao_vocacionado
    end

    assert_redirected_to observacao_vocacionados_path
  end
end
