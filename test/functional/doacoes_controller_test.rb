require 'test_helper'

class DoacoesControllerTest < ActionController::TestCase
  setup do
    @doacao = doacoes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doacoes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doacao" do
    assert_difference('Doacao.count') do
      post :create, doacao: {  }
    end

    assert_redirected_to doacao_path(assigns(:doacao))
  end

  test "should show doacao" do
    get :show, id: @doacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doacao
    assert_response :success
  end

  test "should update doacao" do
    put :update, id: @doacao, doacao: {  }
    assert_redirected_to doacao_path(assigns(:doacao))
  end

  test "should destroy doacao" do
    assert_difference('Doacao.count', -1) do
      delete :destroy, id: @doacao
    end

    assert_redirected_to doacoes_path
  end
end
