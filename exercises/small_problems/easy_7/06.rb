=begin
--- P
Input(s):
- A string containing letter and other characters
Output(s):
- A new string which contains the characters from the original string with staggered capitalization e.g (iLu)

Explicit rules:
- Characters that are not letters are NOT included in the count but included in the return value
Implicit rules:
- Even characters that are letters are uppercase, and others are lowercase
--- E
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
--- D
- Array of letter characters
--- A
- Iterate through the array of letter characters
- If the index of the current letter is even,
  - Replace it with its uppercase version
- Else, replace it with its lowercase version
=end

# def staggered_case(str)
#   count = 0
#   str.chars.map do |char|
#     count += 1 if char =~ /[a-z]/i
#     count.odd? ? char.upcase : char.downcase
#   end.join
# end

# Alternative:
def staggered_case(str, include_nonletter = true, start_upper = true)
  count = (start_upper ? 0 : -1)

  str.chars.map do |char|
    count += 1 if include_nonletter || !include_nonletter && char =~ /[a-z]/i

    count.odd? ? char.upcase : char.downcase
  end.join
end

staggered_case('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS', false) == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'
