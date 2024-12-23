require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

# Use the "/data" directory in production and "/data/test" directory in testing
def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../data/test", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

# Use "/users.yml" file in production and "/test/users.yml" file in testing
def load_users
  file_path =
    if ENV["RACK_ENV"] == "test"
      File.expand_path("../test/users.yml", __FILE__)
    else
      File.expand_path("../users.yml", __FILE__)
    end

  YAML.load_file(file_path)
end

# Display the index page
get "/" do
  pattern = File.join(data_path, '*')
  @files = Dir.glob(pattern).map do |file|
    File.basename(file)
  end

  erb :index
end

def signed_in?
  !!session[:user]
end

def require_signed_in_user
  unless signed_in?
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

# Render form to create a new file
get "/new" do
  require_signed_in_user

  erb :new_file
end

# Create a new file
post "/create" do
  require_signed_in_user

  file_name = params[:file_name].strip

  if file_name.size > 0
    file_path = File.join(data_path, file_name)
    File.new(file_path, 'w')

    session[:message] = "#{file_name} was created."
    redirect "/"
  else
    status "422"
    session[:message] = "A name is required."
    erb :new_file
  end
end

# Render markdown file
def render_markdown(file)
  renderer = Redcarpet::Render::HTML.new(escape_html: true)
  markdown = Redcarpet::Markdown.new(renderer)
  markdown.render(file)
end

# Load content based on the file extension
def load_file(path)
  content = File.read(path)

  case File.extname(path)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  when '.md'
    erb render_markdown(content)
  end
end

# Display each file in plain text
get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.file?(file_path)
    load_file(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Display form to edit a single file
get "/:filename/edit" do
  require_signed_in_user

  @file_name = params[:filename]
  file_path = File.join(data_path, @file_name)
  @file_content = File.read(file_path)

  erb :edit_file
end

# Update the content of an existing file
post "/:filename" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  File.write(file_path, params[:file_content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end

# Delete an existing file
post "/:filename/delete" do
  require_signed_in_user

  file_path = File.join(data_path, params[:filename])
  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted."
  redirect "/"
end

# Render form for users to sign in
get "/users/signin" do
  erb :sign_in
end

# Check if the combination of username and password is valid
def valid_user?(username, password)
  users = load_users
  BCrypt::Password.new(users[username]) == password
end

# Sign in as a user
post "/users/signin" do
  username = params[:username]
  password = params[:password]

  if valid_user?(username, password)
    session[:user] = username
    session[:message] = "Welcome!"
    redirect "/"
  else
    status 422
    session[:message] = "Invalid credentials"
    erb :sign_in
  end
end

# Sign out as a user
post "/users/signout" do
  session.delete(:user)
  session[:message] = "You have been signed out."
  redirect "/"
end
