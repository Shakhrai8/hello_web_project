require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  get '/hello' do
    name = params[:name]

    return "Hello #{name}"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: \"#{message}\""
  end

  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0
  
end
