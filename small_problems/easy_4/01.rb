=begin
--- P
Inputs:
- Two strings of different lengths
Output:
- A string concatenated in the order of:
  - Shorter string
  - Longer string
  - Shorter string
Implicit rules:
- Strings can be empty
--- E
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
--- D

--- A
- If String 1 is shorter than String 2,
  - Assign String 1 to `short` and String 2 to `long`
- Else, if String 1 is longer than String 2,
  - Assign String 1 to `long` and String 2 to `short`
- Concatenate the strings in the order:
  - Short, long, short
=end

def short_long_short(str1, str2)
  short, long = str1.size < str2.size ? [str1, str2] : [str2, str1]
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
