require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get registrar_responsable" do
    get home_registrar_responsable_url
    assert_response :success
  end

  test "should get listar_ofertas" do
    get home_listar_ofertas_url
    assert_response :success
  end

  test "should get RegistrarDiaCampo" do
    get home_RegistrarDiaCampo_url
    assert_response :success
  end

  test "should get CotizarDiaCampo" do
    get home_CotizarDiaCampo_url
    assert_response :success
  end

  test "should get ListaPedidos" do
    get home_ListaPedidos_url
    assert_response :success
  end

  test "should get Mantener_ofertas" do
    get home_Mantener_ofertas_url
    assert_response :success
  end

  test "should get Comentar_ofertas" do
    get home_Comentar_ofertas_url
    assert_response :success
  end

  test "should get mjuegos" do
    get home_mjuegos_url
    assert_response :success
  end

  test "should get solicitudes" do
    get home_solicitudes_url
    assert_response :success
  end

  test "should get vsolicitud" do
    get home_vsolicitud_url
    assert_response :success
  end

end
