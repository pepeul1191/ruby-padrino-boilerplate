App::App.controllers :login do
  get :index do
    render 'login/index', :layout => 'blank'
  end

  post :acceder do

  end

  get :ver_usuario, :map => '/usuario/ver' do
    'usuario/ver'
  end

  get :salir, :map => '/usuario/salir' do
    'usuario/salir'
  end
end
