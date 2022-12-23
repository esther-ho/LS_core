=begin
--- P
Inputs:
- User input of 6 numbers
Outputs:
- All the numbers given by user
- Whether the last number given appears amongst the previous 5

Implicit rules:
- Numbers given can be repeated
- Numbers do not have to be in any order
- Numbers given are whole numbers
- Numbers given are 0 or greater
- Output array is sorted in order of input

--- E
- The number 17 appears in [25, 15, 20, 17, 23].
- The number 18 does not appear in [25, 15, 20, 17, 23].

--- D
- Use an array to store the first 5 numbers

--- A
- For the first 5 numbers:
  - Ask user for a number
  - Check if input is a valid non-negative integer
  - Convert the input into a number
  - Push the number into an array
- Ask the user for the last number
- Check if input is a valid non-negative integer
- Convert the input into a number
- If the last number exists in the number array
  - Print that it appears in the array
- Else, print that it does not appear in the array

=end

def valid_number?(number)
  /^[[:digit:]]+$/.match(number)
end

def count_message(number)
  case number
  when 1 then "1st"
  when 2 then "2nd"
  when 3 then "3rd"
  when 4 then "4th"
  when 5 then "5th"
  end
end

def get_number
  number = ''

  loop do
    number = gets.chomp
    break if valid_number?(number)
    puts "That is not a valid number. Try again."
  end

  number
end

numbers = []
until numbers.size == 5
  puts "==> Enter the #{count_message(numbers.size + 1)} number:"

  number = get_number
  numbers << number.to_i
end

puts "==> Enter the last number:"
last_number = get_number

if numbers.include?(last_number.to_i)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
