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

    get last_response["Location"]

    assert_equal 200, last_response.status
    assert_includes last_response.body, "notafile.ext does not exist."

    get "/"
    refute_includes last_response.body, "notafile.ext does not exist."
  end

  def test_edit_form
    create_file "changes.txt"

    get "/changes.txt/edit"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<textarea id="file_content")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_update_file_content
    create_file "changes.txt"
    post "/changes.txt", file_content: "test"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_equal 200, last_response.status
    assert_includes last_response.body, "changes.txt has been updated."

    get "/"
    refute_includes last_response.body, "changes.txt has been updated."

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "test"
  end

  def test_new_file_form
    get "/new"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<input id="file_name")
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_create_new_file
    post "/create", file_name: "test.txt"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_equal 200, last_response.status

    get "/"
    refute_includes last_response.body, "test.txt was created."
  end

  def test_error_creating_new_file
    post "/create", file_name: ""
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
    assert_includes last_response.body, "<form"
    assert_includes last_response.body, %q(<input id="file_name")
    assert_includes last_response.body, %q(<button type="submit")
  end
end