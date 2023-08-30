=begin
--- P
Input: a text file containing a long string
Output: print the longest sentence and numbers of words in the sentence

Explicit rules:
- Sentences end with either '.', '!', or '?'
- Characters that are not spaces or sentence-ending characters count as a word
- The sentence length is determined by the number of words

Questions:
- What happens if multiple sentences are the longest?

--- E

--- D
- Input: a text file (a long string)
- In-between: an array of sentences
- Output: a string

--- A
- Split the text file into its individual sentences
- Find the longest sentence
=end

def longest_sentence(text)
  sentences = text.split(/\.|\?|\!/)
  sentences.sort_by! { |sentence| sentence.split.size }
  puts "#{sentences[-1]}"
  puts "Word count: #{sentences[-1].split.size}"
end

# Further exploration

# def longest_sentence(text)
#   sentences = text.split(/(?<=[.?!])/)
#   sentences.sort_by! { |sentence| sentence.split.size }
#   puts sentences[-1]
#   puts "Word count: #{sentences[-1].split.size}"
# end

# def longest_word(text)
#   words = text.split(/[ .?!,\n]/)
#   words.sort_by! { |word| word.size }
#   puts words[-1]
#   puts "Word length: #{words[-1].size}"
# end

# def longest_paragraph(text)
#   paragraphs = text.split(/\n{2,}/)
#   paragraphs.sort_by! { |paragraph| paragraph.split.size }
#   puts paragraphs[-1]
#   puts "Word count: #{paragraphs[-1].split.size}"
# end

text = File.read('gutenberg_text.txt')
longest_sentence(text)
# longest_word(text)
# longest_paragraph(text)
