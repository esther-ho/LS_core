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
