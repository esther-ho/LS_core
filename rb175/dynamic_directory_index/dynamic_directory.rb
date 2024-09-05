require 'sinatra'
require 'sinatra/reloader'

get "/" do
  @files = Dir.children("public")
  erb :index
end
