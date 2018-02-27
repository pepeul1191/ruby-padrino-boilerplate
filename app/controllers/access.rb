App::App.controllers :access do
  get :error, :with => :error_code do
    numero_error = params[:error_code]
    error = nil
    case numero_error.to_i
    when 404
      status 400
      error = {
        :numero => 404,
        :mensaje => 'Archivo no encontrado',
        :descripcion => 'La página que busca no se encuentra en el servidor',
        :icono => 'fa fa-exclamation-triangle'
      }
    when 501
      status 501
      error = {
        :numero => 501,
        :mensaje => 'Página en Contrucción',
        :descripcion => 'Lamentamos el incoveniente,
        estamos trabajando en ello.',
        :icono => 'fa fa-code-fork'
      }
    when 5050
      status 5050
      error = {
        :numero => 5050,
        :mensaje => 'Acceso restringido',
        :descripcion => 'No cuenta con los privilegios necesarios.',
        :icono => 'fa fa-ban'
      }
    when 5051
      status 5051
      error = {
        :numero => 5050,
        :mensaje => 'Acceso restringido',
        :descripcion => 'Necesita estar logueado.',
        :icono => 'fa fa-ban'
      }
    when 8080
      status 8080
      error = {
        :numero => 8080,
        :mensaje => 'Tiempo de la sesion agotado',
        :descripcion => 'Vuelva a ingresar al sistema.',
        :icono => 'fa fa-clock-o'
      }
    else
      error = {
        :numero => 404,
        :mensaje => 'Archivo no encontrado',
        :descripcion => 'La página que busca no se encuentra en el servidor',
        :icono => 'fa fa-exclamation-triangle'
      }
    end
    locals = {
      :csss => [
        'bower_components/bootstrap/dist/css/bootstrap.min',
        'bower_components/font-awesome/css/font-awesome.min',
      ],
      :jss => [
        'bower_components/jquery/dist/jquery.min',
        'bower_components/bootstrap/dist/js/bootstrap.min',
      ],
      :body_error => false,
      :title => 'Error de Acceso ' + numero_error.to_str,
      :datos => error
    }
    render 'access/error', :layout => 'blank', :locals => locals
  end
end
