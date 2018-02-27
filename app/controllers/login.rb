App::App.controllers :login do
  before :index do
    if ApplicationHelper.session_activa(session) == true then
      redirect_to CONSTANTS[:BASE_URL]
    end
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
      :mensaje => false
    }
    render 'login/index', :layout => 'blank', :locals => locals
  end

  before :acceder do
    if ApplicationHelper.csrf_validate(params[:csrf]) == false then
      redirect_to CONSTANTS[:BASE_URL] + 'access/error/505'
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
    else
      session[:estado] = 'activo'
      session[:usuario] = params[:usuario]
      session[:tiempo] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
      redirect_to CONSTANTS[:BASE_URL]
    end
  end

  get :ver_usuario, :map => '/usuario/ver' do
    begin
      'usuario : ' + session[:usuario] + '</br>' + 'estado : ' + session[:estado] + '</br>' + 'tiempo : ' + session[:tiempo]
    rescue TypeError => e
      'Alguno de las variables de session están nulas'
    end
  end

  get :salir, :map => '/usuario/salir' do
    session.clear
    redirect_to CONSTANTS[:BASE_URL] + 'login'
  end
end
