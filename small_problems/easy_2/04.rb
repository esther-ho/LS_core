=begin
--- P
Inputs:
- User's current age
- Age at which user would like to retire
Outputs:
- Year in which user will retire
- Number of years user has to work before retirement
Implicit rules:
- Only whole numbers are given as input
- Input can be modified
--- E
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
--- D

--- A
- Ask user for their age and store input
- Ask user for the age they want to retire and store input
- Convert both string inputs to integers
- Subtract the age they want to retire from their current age
- Add the result to the current year
- Print the current year, year of retirement, and years to retirement
=end

require 'date'

CURRENT_YEAR = Date.today.year

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_age = gets.chomp.to_i

years_to_retirement = retire_age - age
retire_on = CURRENT_YEAR + years_to_retirement

puts "It's #{CURRENT_YEAR}. You will retire in #{retire_on}."
puts "You have only #{years_to_retirement} years of work to go!"
