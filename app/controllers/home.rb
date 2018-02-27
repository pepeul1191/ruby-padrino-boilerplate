App::App.controllers :home do
  before :index do
    if ApplicationHelper.session_activa(session) != true then
      redirect_to CONSTANTS[:BASE_URL] + 'login'
    end
  end

  get :index, :map => '/' do
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
    render 'home/index', :layout => 'home', :locals => locals
  end
end
