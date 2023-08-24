=begin
--- P
Input: three integers between 0 and 100
Output: a string which corresponds to the letter grade of the average score

Explicit rules:
- The scores will not be negative or over 100
- Grades are 'A', 'B', 'C', 'D', and 'F'

--- E
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

--- D
Input: three integers
In-between: a integer which is the average of three integers
Output: a string

50, 50, 95 -> 65 -> 'D'

--- A
- Calculate the average of the three scores
- Find the letter grade that corresponds to the average
=end

def get_grade(*scores)
  average = scores.sum / 3
  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  when 0...60 then 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
