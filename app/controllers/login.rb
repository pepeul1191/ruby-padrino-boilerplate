App::App.controllers :login do
  before :index do
    puts 'before login_controller/index'
  end

  get :index do
    locals = {
      :csss => [
        'bower_components/bootstrap/dist/css/bootstrap.min',
        'bower_components/font-awesome/css/font-awesome.min',
      ],
      :jss => [
        'bower_components/jquery/dist/jquery.min',
        'bower_components/bootstrap/dist/js/bootstrap.min',
      ],
    }
    render 'login/index', :layout => 'blank', :locals => locals
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
