=begin
--- P
Input(s):
- An array of string elements
Output(s):
- An interpolated string "#{vehicle} = > #{count}"
Explicit rules:
- Elements are case-sensitive
Implicit rules:
- Array elements are not sorted
--- E
count_occurrences(vehicles)
car => 4
truck => 3
SUV => 1
motorcycle => 2
--- D
- Input array of string elements
--- A
- Filter the `vehicles` array to its unique elements
- Iterate through the unique array
- For each iteration
  - Count the times the current element is present in the array
  - Interpolate result and key into string "#{vehicle} => #{count}"
=end

def count_occurrences(arr)
  arr = arr.map(&:downcase)
  arr.uniq.each do |vehicle|
    puts "#{vehicle} => #{arr.count(vehicle)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 'CAR'
]

count_occurrences(vehicles)
