require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "psych"

get "/" do
  user_data = Psych.load_file "data/users.yml"
  user_data.inspect
end
