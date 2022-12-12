=begin
Using `<<` mutates the original `buffer` array
  - The `buffer` variable continues to point to the same object in memory
Using `+` to concatenate does not modify the original array
  - `input_array` points to the same object in memory that is unmodified
  - `buffer` points to a different concatenated array
The first method mutates the original array while the second method doesn't.
=end

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
