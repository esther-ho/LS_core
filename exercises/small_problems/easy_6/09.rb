=begin
--- P
Input(s):
- An array of integers and/or nil
- An search value that is an integer or nil value
Output(s):
- Return true if the integer or nil value exists in the input array
- Return false if the integer or nil value does not exist in the input array
Explicit rules:
Implicit rules:
- An array is always given as input
--- E
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
--- D
- Input array
--- A
- Iterate through the input array
- If the given search value is present in the input array,
  - Return true
- Else, return false
=end

def include?(arr, search_value)
  arr.any? { |el| el == search_value }
end

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
