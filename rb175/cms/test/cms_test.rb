ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../cms"

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_file(name, content = "")
    file_path = File.join(data_path, name)
    File.open(file_path, "w")  { |f| f.write(content) }
  end

  def session
    last_request.session
  end

  def admin_session
    { "rack.session" => { user: "admin" } }
  end

  def test_index
    create_file "about.md"
    create_file "changes.txt"

    get "/"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, %q(<a href="/about.md/edit")
    assert_includes last_response.body, %q(<a href="/new">New Document)
    assert_includes last_response.body, %q(<form action="/about.md/delete")
  end

  def test_txt_file
    create_file "history.txt", "2000 - Ruby 1.6 released."

    get "/history.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "2000 - Ruby 1.6 released."
  end

  def test_md_file
    create_file "about.md", "# Ruby is..."

    get "/about.md"
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_nonexistent_file
    get "/notafile.ext"
    assert_equal 302, last_response.status
    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_edit_form
    create_file "changes.txt"

    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<textarea id="file_content")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_edit_form_signed_out
    create_file "changes.txt"

    get "/changes.txt/edit"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_update_file_content
    create_file "changes.txt"
    post "/changes.txt", { file_content: "test" }, admin_session
    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "test"
  end

  def test_update_file_content_signed_out
    create_file "changes.txt"
    post "/changes.txt", { file_content: "test" }
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_new_file_form
    get "/new", {}, admin_session
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<input id="file_name")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_new_file_form_signed_out
    get "/new"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_file
    post "/create", { file_name: "test.txt" }, admin_session
    assert_equal 302, last_response.status
    assert_equal "test.txt was created.", session[:message]
  end

  def test_create_new_file_signed_out
    post "/create", { file_name: "test.txt" }
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_file_without_name
    post "/create", { file_name: "" }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<input id="file_name")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_delete_file
    create_file "about.md"

    post "/about.md/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "about.md has been deleted.", session[:message]
  end

  def test_delete_file_signed_out
    create_file "about.md"

    post "/about.md/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_sign_in_form
    get "/users/signin"
    assert_equal 200, last_response.status
    assert_includes last_response.body, %q(<form action="/users/signin")
    assert_includes last_response.body, %q(<input id="username")
    assert_includes last_response.body, %q(<input id="password")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_user_sign_in
    post "/users/signin", { username: "admin", password: "secret" }
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:user]

    get last_response["Location"]
    assert_includes last_response.body, "Signed in as admin."
    assert_includes last_response.body, "Sign Out"
  end

  def test_error_signing_in
    post "/users/signin", { username: "admin", password: "test" }
    assert_equal 422, last_response.status
    assert_nil session[:user]
    assert_includes last_response.body, "Invalid credentials"
    assert_includes last_response.body, %q(<input id="username")
    assert_includes last_response.body, %q(<input id="password")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_user_sign_out
    get "/", {}, admin_session
    post "/users/signout"
    assert_equal 302, last_response.status
    assert_equal "You have been signed out.", session[:message]

    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_nil session[:user]
    assert_includes last_response.body, "Sign In"
  end
end
