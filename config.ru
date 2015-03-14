# Rack::Lint fix
ENV['SERVER_PORT'] = '80'

require 'middleman/rack'

app = Middleman::Application.server


run app
