require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

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
    render_markdown(content)
  end
end

# Display each file in plain text
get "/:filename" do
  file_path = "#{root}/data/#{params[:filename]}"

  if File.file?(file_path)
    load_file(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# Display form to edit a single file
get "/:filename/edit" do
  @file_name = params[:filename]
  file_path = "#{root}/data/#{@file_name}"
  @file_content = File.read(file_path)

  erb :edit_file
end

# Update the content of an existing file
post "/:filename" do
  file_path = "#{root}/data/#{params[:filename]}"
  File.write(file_path, params[:file_content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end
