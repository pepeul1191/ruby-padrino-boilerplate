## Python3 Tornado

Requisitos de software previamente instalado:

+ Ruby 2.3.1+
+ Bundler

### Descipción

En caso de usar el servicio en ruby:

    $ bundler install --binstubs

Instalar gem adicionales:

    $ gem install puma rerun sequel

Arrancar servidor Padrino con webrick:

    $ padrino s

Arrancar servidor puma:

    $ puma

Si deseamos crear un subproyecto dentro del principal, hacer lo siguiente:

    $ cd my_project
    $ padrino g app gallery

Para crear los controladores usamos lo siguiente:

    $ padrino g controller sample get:index --app gallery

### Fuentes:

+ http://padrinorb.com/guides/  

Thanks/Credits

    Pepe Valdivia: developer Software Web Perú [http://softweb.pe]
