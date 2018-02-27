require_relative '../models/departamento'

App::Ubicaciones.controllers :departamento do
  get :index do
    locals = {
      :csss => [
        'bower_components/bootstrap/dist/css/bootstrap.min',
        'bower_components/font-awesome/css/font-awesome.min',
      ],
      :jss => [
        'bower_components/jquery/dist/jquery.min',
        'bower_components/bootstrap/dist/js/bootstrap.min',
        'bower_components/requirejs/require',
      ],
    }
    render 'departamento/index', :layout => 'blank', :locals => locals
  end

  get :listar do
    Departamento.all.to_a.to_json
  end
end
