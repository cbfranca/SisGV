require 'test_helper'

class VocacionadosControllerTest < ActionController::TestCase
  setup do
    @vocacionado = vocacionados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocacionados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocacionado" do
    assert_difference('Vocacionado.count') do
      post :create, vocacionado: { ativo: @vocacionado.ativo, bairro: @vocacionado.bairro, celular: @vocacionado.celular, cep: @vocacionado.cep, cidade: @vocacionado.cidade, cod_escolaridade: @vocacionado.cod_escolaridade, cod_estado: @vocacionado.cod_estado, complemento_endereco: @vocacionado.complemento_endereco, email: @vocacionado.email, endereco: @vocacionado.endereco, nascimento: @vocacionado.nascimento, nome: @vocacionado.nome, primeiro_contato: @vocacionado.primeiro_contato, telefone_residencial: @vocacionado.telefone_residencial }
    end

    assert_redirected_to vocacionado_path(assigns(:vocacionado))
  end

  test "should show vocacionado" do
    get :show, id: @vocacionado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vocacionado
    assert_response :success
  end

  test "should update vocacionado" do
    put :update, id: @vocacionado, vocacionado: { ativo: @vocacionado.ativo, bairro: @vocacionado.bairro, celular: @vocacionado.celular, cep: @vocacionado.cep, cidade: @vocacionado.cidade, cod_escolaridade: @vocacionado.cod_escolaridade, cod_estado: @vocacionado.cod_estado, complemento_endereco: @vocacionado.complemento_endereco, email: @vocacionado.email, endereco: @vocacionado.endereco, nascimento: @vocacionado.nascimento, nome: @vocacionado.nome, primeiro_contato: @vocacionado.primeiro_contato, telefone_residencial: @vocacionado.telefone_residencial }
    assert_redirected_to vocacionado_path(assigns(:vocacionado))
  end

  test "should destroy vocacionado" do
    assert_difference('Vocacionado.count', -1) do
      delete :destroy, id: @vocacionado
    end

    assert_redirected_to vocacionados_path
  end
end
