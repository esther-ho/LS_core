require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

root = File.expand_path('..', __FILE__)

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

# Display the index page
get "/" do
  @files = Dir.glob("#{root}/data/*").map do |file|
    File.basename(file)
  end

  erb :index
end

# Display each file in plain text
get "/:filename" do
  file_path = "#{root}/data/#{params[:filename]}"

  if File.file?(file_path)
    headers['Content-Type'] = 'text/plain'
    File.read(file_path)
  else
    session[:error] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end
