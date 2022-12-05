=begin
--- P
Inputs:
- User input of an integer greater than 0
- User to choose between computing'sum' or 'product'
Output:
- Depending on user's choice, print:
  - Sum of all numbers between 1 and given number
  - Product of all numbers between 1 and given number
Implicit rules:
- Given number is a whole number
- Given number is included in the sum or product
--- E
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.
--- D

--- A
- Ask user for an whole number greater than 0
- Store input and convert it to an integer
- Ask user to choose to compute sum or product
- If user chooses 'sum'
  - Sum all numbers from 1 to given integer
- If not,
  - Multiply all numbers from 1 to given integer
- Print the result
=end
