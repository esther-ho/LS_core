=begin
--- P
Input:
- A year
Output:
- Century that year is from
- String should end with `st`, `nd`, `rd` or `th`
Explicit rules:
- Century begins in year that end with 01
- 1901 - 2000 is 20th century
- 1801 - 1900 is 19th century
Implicit rules:
- Only integers are given
- Zero is not a valid year
--- E
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
--- D
- Store number suffixes (st, nd, rd, th) in an array
--- A
- Divide the given number by a century (100.0) to obtain century as a float
- Return the smallest whole number greater or equal to the float
- If the last two digits of the returned whole number is 11, 12, or 13,
  - Append 'th' to the number string
- Else, find the remainder of the number when divided by 10
- If the remainder is 1,
  - Append 'st' to the number string
- If the remainder is 2,
  - Append 'nd' to the number string
- If the remainder is 3,
  - Append 'rd' to the number string
- Else, if the remainder is 4 or greater
  - Append 'th' to the number string
=end

def century(year)
  century = (year / 100.0).ceil
  return "#{century}th" if (11..13).include?(century % 100)
  case century % 10
  when 1 then "#{century}st"
  when 2 then "#{century}nd"
  when 3 then "#{century}rd"
  else        "#{century}th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
