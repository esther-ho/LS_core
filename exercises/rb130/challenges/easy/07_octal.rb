=begin
--- P
Input: string, represents octal string
Output: an integer, represents decimal number
Rules:
- All characters in the string must be digits
- All digits must be less than 8
- Invalid characters in the string will result in a return value of 0
Class rules:
- #initialize takes a string
- #to_decimal returns an integer
--- E
'10' => 8
'8' => 0
'carrot' => 0
'6789' => 0
'011' => 9
--- D
Input: a string
In-between: array of integers
Output: integer
--- A
- If string contains integers 8 or larger, or non-digit characters, return 0
- Convert string into an array of digits, starting from smallest to largest
- Iterate through each digit in the string with the index
  - Convert current digit to an integer
  - Multiply integer to 8 to the power of (largest index - current index)
- Sum all results
- Return sum
=end

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 unless valid_octal?
    digits = @octal_string.to_i.digits

    digits.each_with_index.reduce(0) do |sum, (digit, i)|
      sum + (digit * (8**i))
    end
  end

  private

  def valid_octal?
    !(@octal_string =~ /[a-z89]/i)
  end
end
