=begin
--- P
Input(s):
- A string containing letter and other characters
Output(s):
- A new string which contains the characters from the original string with staggered capitalization e.g (iLu)

Explicit rules:
- Characters that are not letters are included in the count but no case changes are done
Implicit rules:
- Even characters that are letters are uppercase, and others are lowercase
--- E
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
--- D
- Array of string characters
--- A
- Iterate through the string
- If the index of the current character is even,
  - Replace it with its uppercase version
- Else, replace it with its lowercase version
=end

def staggered_case(str)
  str.chars.map.with_index do |char, i|
    i.even? ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
