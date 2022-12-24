=begin
--- P
Inputs:
- Two positive whole numbers
Outputs:
The results when performing the following operations on the inputs:
- addition, subtraction, product, quotient, remainder, and power

Implicit rules
- Inputs will be valid numbers
- Return value should be an integer

--- E
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

--- D
Store results in a hash, with operators as keys

--- A
- Ask user for the first input
- Store the input
- Ask user for the second input
- Store the input
- Perform operations and store results in a hash
- Print results

=end
