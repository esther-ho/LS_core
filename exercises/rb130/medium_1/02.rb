class TextAnalyzer
  def process
    my_file = File.open("02_sample_text.txt")
    yield(my_file.read)
    my_file.close
  end
end

analyzer = TextAnalyzer.new

# output => 2 paragraphs
analyzer.process do |text|
  paragraph_count = text.split(/\n\n/).count
  puts "#{paragraph_count} paragraphs"
end 


# output => 13 lines
analyzer.process do |text|
  line_count = text.split(/\n|\n\n/).count
  puts "#{line_count} lines"
end

# output => 120 words
analyzer.process do |text|
  word_count = text.split(' ').count
  puts "#{word_count} words"
end
