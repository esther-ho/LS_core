=begin
--- P
- Input: Name provided by the user
- Outputs:
- Prints the name provided by the user, otherwise print 'Teddy'
- A random number between 20 and 200 as the age
- Implicit rules:
  - Name provided should have no spaces
  - Name provided should only contain alphabetical characters
  - Name is not case-sensitive
  - '20' and '200' are included
  - Number printed should be a whole number
--- E
- Output: 'Teddy is 69 years old!'
- your_age('John') #=> 'John is 105 years old!'
--- D
- Array of numbers from 20 to 200
--- A
- Print a prompt to ask user for their name
- Get user input and check if the name is valid
- If no name is entered, use 'Teddy' as the default
- Sample a number randomly from a range of numbers between 20 and 200
- Return the sampled number
- Print the name and sampled number
=end

def your_age
  name = ''

  loop do
    puts "What is your name?"
    name = gets.chomp.strip
    break if /^[[:alpha:]]+$/.match(name) || name.empty?
    puts "That doesn't look like a valid name..."
  end

  name = 'teddy' if name.empty?
  age = rand(20..200)
  puts "#{name.capitalize} is #{age} years old!"
end

your_age
