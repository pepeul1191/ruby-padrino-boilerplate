App::App.controllers :home do
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
