require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "psych"

before do
  @user_data = Psych.load_file "data/users.yml"
  @users = @user_data.keys
end

get "/" do
  redirect "/users"
end

get "/users/:name" do
  name = params[:name].to_sym
  redirect "/users" unless @users.include?(name)

  @email = @user_data[name][:email]
  @interests = @user_data[name][:interests]

  @other_users = @users - [name]

  erb :user
end

get "/users" do
  erb :users
end

