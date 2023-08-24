=begin
--- P
Input: an array and a hash
Output: a string with values from the array and hash interpolated within the string

Explicit rules:
- The array contains 2 or more elements
- The hash contains 2 key-value pairs

Implicit rules:
- The array contains string objects as elements
- The hash contains 2 keu-value pairs where the key is a symbol and the value is a string object

--- E
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

--- D
Input: an array and a hash
Output: a string with values from array and hash interpolated within it

--- A
- Join all strings within the array with a space to obtain the full name
- Create a template string
- Interpolate the name, title, and occupation within the string
=end

def greetings(name, job_info)
  name = name.join(' ')

  "Hello, #{name}! Nice to have a #{job_info[:title]} #{job_info[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> "Hello, John Q Doe! Nice to have a Master Plumber around."
