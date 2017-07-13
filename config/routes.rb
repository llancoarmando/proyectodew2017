Rails.application.routes.draw do
  get 'home/registrar_responsable'
  
  post 'home/registrar_responsable_post'

  get 'home/listar_ofertas'

  get 'home/registrardiacampo'

  get 'home/CotizarDiaCampo'

  get 'home/ListaPedidos'

  get 'home/Mantener_ofertas'

  get 'home/Comentar_ofertas'
  
  get 'home/mant_resp_familia'
  
  get 'home/mantener_servicio'

  get 'home/mjuegos'

  get 'home/solicitudes'

  get 'home/vsolicitud'
  
  post 'home/nuevojuego_post'

  get 'home/buscarjuego_get'
  
  post 'home/guardar_juego'
  
  get 'home/eliminar_juego'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
