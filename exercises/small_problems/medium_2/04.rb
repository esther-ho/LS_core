=begin
Input: string
Output: boolean
- true if all parantheses are balanced
- false otherwise

Rules:
- Return true if there are no parantheses in the string
- Balanced means all paratheses have matching '('')' pairs

--- E
What (is) this? -> () -> true
')Hey!(' -> )( -> false
'Hey!' -> true

--- D
input: string
output: boolean

--- A
- Create a new string with just parantheses
  - Remove characters that are not parantheses
- Remove balanced parantheses until new string contain no balanced parantheses
  - Loop through string and remove balanced parantheses for every iteration
- Return true if new string is empty, otherwise return false
=end

def balanced?(string)
  parantheses = string.gsub(/[^\(\)]/, '')
  
  while parantheses.include?('()')
    parantheses.gsub!('()', '')
  end

  parantheses.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

# Further exploration

# def all_balanced?(string)
#   pairs = { '(' => ')', '{' => '}', '[' => ']' }
#   stack = []
#   string = string.gsub(/[^'"(){}\[\]]/, '')
  
#   string.each_char do |char|
#     if char.match(/['"]/)
#       stack[-1] == char ? stack.pop : stack.push(char)
#     else
#       stack.push(char) if char.match(/[({\[]/)
#       return false if char.match(/[)}\]]/) && pairs[stack.pop] != char
#     end
#   end

#   stack.empty?
# end

# p all_balanced?("'Hey!'") == true
# p all_balanced?('What [{is}] [t]his') == true
# p all_balanced?('"Hey!') == false
# p all_balanced?('What is)"() this') == false
# p all_balanced?('What is [(t])h}is') == false
