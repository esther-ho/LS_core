=begin
--- P
Input:
- A positive whole number
Output:
- An array of digits in the number
Implicit rules:
- Digits in the array appear in the order of how they appear in the number
  - E.g. 444 => [4, 4, 4]
- Repeated digits are not omitted
--- E
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
--- D
- An array containing the digits in the number
--- A
- Convert the number to its string form
- Split the string into its individual digits
- Convert each digit into its integer form
=end

def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

=begin
Alternatives:
- Divide integer by 10 and append remainder to an array

def digit_list(num)
  digits = []
  while num > 0
    num, remainder = num.divmod(10)
    digits.unshift(remainder)
  end
  digits
end

- Use Ruby's `Integer#digits` method

def digit_list(num)
  num.digits.reverse
end
=end
