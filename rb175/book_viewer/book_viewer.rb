require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, i|
      "<p id=paragraph#{i}>#{paragraph}</p>"
    end.join
  end

  def highlight_match(text, query)
    text.gsub(query, "<strong>#{query}</strong>")
  end
end

before do
  @contents = File.readlines "data/toc.txt"
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  redirect "/" unless (1..@contents.size).cover?(number)

  chapter_name = @contents.fetch(number - 1)

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read "data/chp#{number}.txt"

  erb :chapter
end

def each_chapter
  @contents.each_with_index do |title, i|
    number = i + 1
    text = File.read "data/chp#{number}.txt"
    yield title, number, text
  end

  @contents
end

def matching_chapters(query)
  results = []
  return results if query.nil? || query.empty?

  each_chapter do |title, number, text|
    matches = {}
    text.split("\n\n").each_with_index do |paragraph, i|
      matches[i] = paragraph if paragraph.include?(query)
    end

    results << { title: title, number: number, paragraphs: matches } unless matches.empty?
  end

  results
end

get "/search" do
  @results = matching_chapters(params[:query])

  erb :search
end

not_found do
  redirect "/"
end
