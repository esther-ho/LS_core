=begin
#upcase! is a mutating method.
Therefore, `name.upcase!` mutates 'Bob' to 'BOB'.
`save_name` references the same object as `name`.
Therefore, `puts name, save_name` will print 'BOB' twice
=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
