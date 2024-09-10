require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "psych"

before do
  @user_data = Psych.load_file "data/users.yml"
end

get "/" do
  redirect "/users"
end

get "/users" do
  @users = @user_data.keys
  erb :users
end
