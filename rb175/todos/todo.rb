require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
end

# Retrieve list id and list hash when working with a single list
before "/lists/:list_id/?*?" do
  @list_id = params[:list_id].to_i
  @list = session[:lists][@list_id]
end

# Retrieve the todo id and the todo hash of a single todo item
before "/lists/:list_id/todos/:todo_id/?*?" do
  @todo_id = params[:todo_id].to_i
  @todo = @list[:todos][@todo_id]
end

get "/" do
  redirect "/lists"
end

# View list of lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Return an error message if the list name is invalid, and return nil otherwise
def error_for_list_name(name)
  if !(1..100).cover?(name.size)
    "The list name must be between 1 and 100 characters."
  elsif session[:lists].any? { |list| list[:name] == name }
    "The list name must be unique."
  end
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect "/lists"
  end
end

# View a single list
get "/lists/:list_id" do
  erb :list, layout: :layout
end

# Render the form to rename an existing list
get "/lists/:list_id/edit" do
  erb :edit_list, layout: :layout
end

# Rename an existing list
post "/lists/:list_id" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{@list_id}"
  end
end

# Delete an existing list
post "/lists/:list_id/delete" do
  session[:lists].delete_at(@list_id)
  session[:success] = "The list has been deleted."

  redirect "/lists"
end

# Return an error message if the todo name is invalid, and nil otherwise
def error_for_todo(todo)
  if !(1..100).cover?(todo.size)
    "Todo must be between 1 and 100 characters."
  end
end

# Add a todo item to an existing list
post "/lists/:list_id/todos" do
  text = params[:todo].strip

  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << { name: text, completed: false }
    session[:success] = "A todo has been added."
    redirect "/lists/#{@list_id}"
  end
end

# Delete a todo from an existing list
post "/lists/:list_id/todos/:todo_id/delete" do
  @list[:todos].delete_at(@todo_id)
  session[:success] = "The todo has been deleted."

  redirect "/lists/#{@list_id}"
end

# Update the status of a todo
post "/lists/:list_id/todos/:todo_id" do
  is_completed = (params[:completed] == "true")
  @todo[:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{@list_id}"
end

# Complete all todos of a single list
post "/lists/:list_id/complete_all" do
  @list[:todos].each { |todo| todo[:completed] = true }

  session[:success] = "All todos have been completed."
  redirect "/lists/#{@list_id}"
end
