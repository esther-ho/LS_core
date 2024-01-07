class FixedArray
  def initialize(length)
    @array = [nil] * length
  end

  # `#fetch` raises an IndexError if index is out of bounds
  def [](index)
    array.fetch(index)
  end

  # invoking `#[]` will raise an IndexError if index is invalud
  def []=(index, value)
    self[index]
    array[index] = value
  end

  # Returning a copy of the array object prevents unwanted manipulation
  def to_a
    array.clone
  end

  # String conversion is done on the array copy
  def to_s
    to_a.to_s
  end

  private

  attr_reader :array
end



fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
