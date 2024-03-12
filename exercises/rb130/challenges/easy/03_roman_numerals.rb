=begin
--- P
Input: Integer
Output: String
Rules:
- String represents roman numeral
- Value is subtracted when placed in front
- Value is added when placed at the back
- No need to convert beyond 3000
- Zeros are ignored
Class needs:
- #initialize that accepts one integer
- #to_roman that converts decimal to roman numeral
--- E
- 1 -> 'I'
- 3 -> 'III'
- 4 -> 'IV'
- 5 -> 'V'
- 6 -> 'VI'
- 9 -> 'IX'
- 10 -> 'X'
- 29 -> 'XXIX'
- 50 -> 'L'
- 80 -> 'LXXX'
- 90 -> 'XC'
- 100 -> 'C'
- 400 -> 'CD'
- 500 -> 'D'
- 900 -> 'CM'
- 1000 -> 'M'
--- D
Input: integer
Output: string
--- A
- Make a reference of decimal to roman numerals
- Initialize an empty array
- Iterate through the reference:
  - Divide my_num by the key in the hash
  - Multiply the roman numeral by the quotient and push the string to the array
  - Reassign the remainder to my_num
- Join all strings in the array
=end

class RomanNumeral
  NUM_TO_ROMAN = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
}

  def initialize(num)
    @num = num
  end

  def to_roman
    my_num = @num
    roman_digits = []

    NUM_TO_ROMAN.each do |num, roman|
      quotient, my_num = my_num.divmod(num)
      roman_digits << roman * quotient
    end
  
    roman_digits.join
  end
end
