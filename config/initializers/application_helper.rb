class ApplicationHelper
  def self.load_css(csss)
    rpta = ''
    if defined? csss
      csss.each do |css|
        temp = '<link href="' + CONSTANTS[:STATIC_URL] + css + '.css" rel="stylesheet"/>'
        rpta = rpta + temp
      end
    end
    rpta.html_safe
  end

  def self.load_js(jss)
    rpta = ''
    if defined? jss
      jss.each do |js|
        temp = '<script src="' + CONSTANTS[:STATIC_URL] + js + '.js" type="text/javascript"></script>'
        rpta = rpta + temp
      end
    end
    rpta.html_safe
  end

  def self.input_csrf
    rpta = '<input type="hidden" name="csrf" id="csrf_token" value="' + CONSTANTS[:CSRF] + '">'
    rpta.html_safe
  end

  def self.csrf_validate(request_token)
    CONSTANTS[:CSRF] == request_token
  end

  def self.session_activa(session)
    session[:estado] == 'activo'
  end
end
