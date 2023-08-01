# Output all the vowels from the strings using the each method

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, words|
  words.each do |word|
    word.chars.each do |char|
      puts char if char =~ /[aeiou]/i
    end
  end
end

# Alternative:
# hsh.values.flatten.each do |word|
#   word.gsub!(/[^aeiou]/, '')
#   puts word.chars
# end
