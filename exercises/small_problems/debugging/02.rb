def shout_out_to(name)
  # the elements in the array created by `#chars` are not pointing to the substrings in string object `name`
  # name.chars.each { |c| c.upcase! }
  name.upcase!

  puts 'HEY ' + name
  # Alternative: puts 'HEY ' + name.upcase
end

shout_out_to('you') # expected: 'HEY YOU'
