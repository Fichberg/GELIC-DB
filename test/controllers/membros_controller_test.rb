require 'test_helper'

class MembrosControllerTest < ActionController::TestCase
  setup do
    @membro = membros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro" do
    assert_difference('Membro.count') do
      post :create, membro: { data_criacao: @membro.data_criacao, email: @membro.email, email_admin: @membro.email_admin, login: @membro.login, nome: @membro.nome, senha: @membro.senha }
    end

    assert_redirected_to membro_path(assigns(:membro))
  end

  test "should show membro" do
    get :show, id: @membro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro
    assert_response :success
  end

  test "should update membro" do
    patch :update, id: @membro, membro: { data_criacao: @membro.data_criacao, email: @membro.email, email_admin: @membro.email_admin, login: @membro.login, nome: @membro.nome, senha: @membro.senha }
    assert_redirected_to membro_path(assigns(:membro))
  end

  test "should destroy membro" do
    assert_difference('Membro.count', -1) do
      delete :destroy, id: @membro
    end

    assert_redirected_to membros_path
  end
end
