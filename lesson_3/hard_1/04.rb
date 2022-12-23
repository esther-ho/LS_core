=begin
`false` is not returned.
Cases with more or fewer than 4 components should be invalid.
Original code:

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
=end

def is_an_ip_number?(word)
  /[[:digit:]]{1,3}/.match(word) && (0..255).include?(word.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4

  dot_separated_words.each do |word|
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?("4.5.5") # false
p dot_separated_ip_address?("10.4.5.11") # true
p dot_separated_ip_address?("10.aa.4.11") # false
p dot_separated_ip_address?("10.366.4.11") # false
p dot_separated_ip_address?("1.2.3.4.5") # false
