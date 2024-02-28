def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

# Further exploration

def compute(x)
  return "Does not compute." unless block_given?
  yield(x)
end

puts compute(4) { |n| n + 5 + 3 } == 12
puts compute('cd') { |s| 'a' + 'b' + s } == 'abcd'
puts compute(2) == 'Does not compute.'
