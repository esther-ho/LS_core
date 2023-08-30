=begin
--- P
Input: an array of objects
Output: an array of objects where,
- the first element of the input array is moved to the end

Explicit rules:
- The original array should not be mutated

Implicit rules:
- Only the first element is moved to the back in the output array
- All other elements remain in the order of the input array

--- E
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

--- D
Input: an array
In-between: a copy of the input array
Output: an array, where the last element is the first element in the input array

--- A
- Make a copy of the input array
- Move the first element to the end of the array in the copy
  - Remove the first element
  - Append the first element to the array
=end

def rotate_array(array)
  array = array.dup
  array.push(array.shift)
end

# Alternative:

# def rotate_array(array)
#   array.values_at(1..-1, 0)
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further exploration

# Rotates a string

def rotate_string(string)
  string[1..-1] + string[0]
end

p rotate_string('hello') == 'elloh'
p rotate_string('a') == 'a'

# Rotates an integer

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

p rotate_integer(123) == 231
p rotate_integer(1) == 1
