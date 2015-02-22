require 'test_helper'

class CicadasControllerTest < ActionController::TestCase
  setup do
    @cicada = cicadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cicadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cicada" do
    assert_difference('Cicada.count') do
      post :create, cicada: { address: @cicada.address, description: @cicada.description, latitude: @cicada.latitude, longitude: @cicada.longitude, title: @cicada.title }
    end

    assert_redirected_to cicada_path(assigns(:cicada))
  end

  test "should show cicada" do
    get :show, id: @cicada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cicada
    assert_response :success
  end

  test "should update cicada" do
    patch :update, id: @cicada, cicada: { address: @cicada.address, description: @cicada.description, latitude: @cicada.latitude, longitude: @cicada.longitude, title: @cicada.title }
    assert_redirected_to cicada_path(assigns(:cicada))
  end

  test "should destroy cicada" do
    assert_difference('Cicada.count', -1) do
      delete :destroy, id: @cicada
    end

    assert_redirected_to cicadas_path
  end
end
