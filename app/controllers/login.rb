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
      :mensaje => true
    }
    render 'login/index', :layout => 'blank', :locals => locals
  end

  before :acceder do
    if ApplicationHelper.csrf_validate(params[:csrf]) == false then
      status 500
      redirect_to CONSTANTS[:BASE_URL] + 'access/error/500'
    end
  end

  post :acceder do
    rq = HTTParty.post(
      CONSTANTS[:servicios][:accesos] + 'usuario/acceder',
      :query => {
        :usuario => params[:usuario],
        :contrasenia => params[:contrasenia],
      }
    )
    if rq.body == '0' then
      locals = {
        :csss => [
          'bower_components/bootstrap/dist/css/bootstrap.min',
          'bower_components/font-awesome/css/font-awesome.min',
        ],
        :jss => [
          'bower_components/jquery/dist/jquery.min',
          'bower_components/bootstrap/dist/js/bootstrap.min',
        ],
        :mensaje => true, 
      }
      render 'login/index', :layout => 'blank', :locals => locals
    end
  end

  get :ver_usuario, :map => '/usuario/ver' do
    'usuario/ver'
  end

  get :salir, :map => '/usuario/salir' do
    'usuario/salir'
  end
end
