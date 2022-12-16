=begin
The local variable `a_string_param` in the method is an alias for `my_string`.
- They reference the same String object.
In the method, `a_string_param` gets mutated using `#<<`
- `#<<` appends a String object to the original string
The original String is modified
- `my_string` references "pumpkinsrutabaga".

The local variable `an_array_param` is an alias for `my_array`.
- They reference the same Array object.
In the method, `an_array_param` gets reassigned to a new array.
- The new Array object is `['pumpkins', 'rutabaga']`.
The original Array is not modified.
- `my_array` still references `["pumpkins"]`.
=end

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
