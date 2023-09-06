password = nil

# `set_password` has no access to `password` that is not within the scope of the method
def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

# `verify_password` has no access to `password` since it is not passed to the method
def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
