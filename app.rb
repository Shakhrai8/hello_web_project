require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base

  get '/hello' do
    @name = params[:name]

    return erb(:index)
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: \"#{message}\""
  end

  get '/' do
    return 'Hello!'
  end

  get '/names' do
    return "Julia, Mary, Karim"
  end

  post '/sort-names' do
    names = params[:names]
    result = names.sort
    return result.join(',')
  end

  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0
  
end
