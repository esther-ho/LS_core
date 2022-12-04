=begin
--- P
Inputs:
- Bill amount in dollars
- Tip rate in percentage
Outputs:
- Total tip in dollars and cents
- Total bill amount including the tip
Implicit rules:
- User will provide valid numerical inputs
- Inputs can be modified
- Tip percentage given is a whole number
--- E
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
--- D

--- A
- Ask user for the bill amount and store the value
- Ask user for tip percentage and store the value
- Divide the tip percentage by 100
- Find the total tip by:
  Multiplying the new tip % by bill amount
- Add the total tip to the bill amount for the total bill

=end

print "What is the bill? "
bill = gets.chomp.to_f

print "What is the tip percentage? "
tip_percent = gets.chomp.to_f

total_tip = bill * (tip_percent / 100)
total_bill = bill + total_tip

puts
puts "The tip is $#{format('%.2f',total_tip)}"
puts "The total is $#{format('%.2f', total_bill)}"
