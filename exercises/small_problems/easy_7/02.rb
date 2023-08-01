=begin
--- P
Input(s):
- A string containing characters that include numbers and letters
Output(s):
- A hash that contains three key-value pairs where:
  - The keys are:
    - ":lowercase" representing lowercase letters, 
    - ":uppercase" representing uppercase letters,
    - ":neither" representing characters that are neither
  - The values are the number of characters that correspond to the keys
Explicit rules:
Implicit rules:
- Return a value of `0` if no characters corresponding to a key exist
- Input string can be an empty string
- Whitespace e.g. spaces counts as characters
--- E
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
--- D
- Output hash with 3 key-value pairs
--- A
- Initialize a new hash that contains the three keys and set their values to 0
- Split the string into an array of its characters
- Iterate over the array
- For every iteration,
  - If string is lowercase, increment value of :lowercase
  - If string is uppercase, increment value of :uppercase
  - Else, increment value of :neither
- Return the hash
=end

def letter_case_count(str)
  case_count = { lowercase: 0, uppercase: 0, neither: 0}
  
  str.chars.each do |char|
    case char
    when 'a'..'z'
      case_count[:lowercase] += 1
    when 'A'..'Z'
      case_count[:uppercase] += 1
    else
      case_count[:neither] += 1
    end
  end
  
  # Alternative
  # case_count = { lowercase: str.count('a-z'), uppercase: str.count('A-Z'), neither: str.count('^a-zA-Z')}

  case_count
end

letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
