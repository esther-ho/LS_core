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

get "/users/:name" do
  name = params[:name].to_sym
  redirect "/users" unless @user_data.key?(name)
  @email = @user_data[name][:email]
  @interests = @user_data[name][:interests]

  erb :user
end

get "/users" do
  @users = @user_data.keys
  erb :users
end

