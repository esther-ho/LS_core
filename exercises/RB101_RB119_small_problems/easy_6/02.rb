=begin
--- P
Input:
- An array of strings with alphabetic characters
Output:
- The given string with vowels (a, e, i, o u) removed
Implicit rules:
- If the string is empty after vowels are removed,
  - Return the empty string
- The method of removing vowels is case-insensitive
- The original lettercase of the string is preserved
- No mention if the original array can be mutated
--- E
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
--- D
- The given array with one or more strings
- The output array with equal number of strings as the given array
--- A
- Iterate through the array
- For each iteration,
  - Delete vowels (case-insensitive)
- Return the new modified array
=end

def remove_vowels(string_array)
  string_array.map { |word| word.delete "aeiouAEIOU" }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
Alternatives:
- Substitute vowels (case-insensitive) with an empty string

def remove_vowels(strings)
  strings.map { |string| string.gsub(/[aeiou]/i, '')}
end
=end
