require 'sinatra'
require 'sinatra/reloader'

get "/" do
  @files = Dir.children("public").sort
  @files.reverse! if params['sort'] == 'desc'

  erb :index
end
