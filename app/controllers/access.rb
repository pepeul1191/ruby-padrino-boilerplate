App::App.controllers :access do
  get :error, :with => :error_code do
    status params[:error_code].to_i
    'Error : ' + params[:error_code]
  end
end
