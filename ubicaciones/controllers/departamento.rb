require_relative '../models/departamento'

App::Ubicaciones.controllers :departamento do
  get :listar do
    Departamento.all.to_a.to_json
  end
end
