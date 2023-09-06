def neutralize(sentence)
  words = sentence.split(' ')

  # We are iterating and mutating the array of words
  # words.each do |word|
  #   words.delete(word) if negative?(word)
  # end

  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
