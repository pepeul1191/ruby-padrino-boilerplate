require_relative '../models/departamento'

App::Ubicaciones.controllers :departamento do
  get :index do
    render 'departamento/index', :layout => 'blank'
  end

  get :listar do
    Departamento.all.to_a.to_json
  end
end
