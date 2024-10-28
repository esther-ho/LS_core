require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

root = File.expand_path('..', __FILE__)

# Display the index page
get "/" do
  @files = Dir.glob("#{root}/data/*").map do |file|
    File.basename(file)
  end

  erb :index
end
