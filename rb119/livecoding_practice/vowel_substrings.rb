# A substring is a contiguous (non-empty) sequence of characters within a string.
  
# A vowel substring is a substring that only consists of vowels ('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.
  
# Given a string word, return the number of vowel substrings in word.

=begin
--- P
Find the number of substrings that only contain all 5 vowels.

Input(s):
- A string of only letters
Output(s):
- An integer which is the count of number of applicable substrings
Explicit rules:
- A vowel substring must only have vowels and all five vowels must be present
Implicit rules:
- All letters are lowercase
- Vowels do not have to be in alphabetical order
- Substrings can have repeated vowels
- Substrings are at least 5 letters long
--- E
p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0
--- D
- Input: string
- In between:
  - Array of substrings that are 5 or more characters
  - Array of substrings that contain all 5 vowels
- Output: integer
--- A
- Return 0 if the string is less than 5 characters long
- Find all substrings that are 5 or more characters long
  - Initialize an empty 'substrings' array
  - Split the given string into an array of its characters
  - Iterate through the array
    - For each iteration,
      - Exit the iteration if there are no substrings of length 5 or longer
      - Find substrings of increasing length starting from 5
        - Push substring into 'substrings' array
        - Increment length of substring by 1 for each iteration
        - Exit iteration if there are no more substrings of length 5 or longer
- Check if substrings are all vowels and all 5 vowels are present
  - Remove any substrings that contain non-vowel letters
  - Remove any substrings when reduced to its unique vowels, have less than 5 unique vowels
- Return the count of applicable substrings
=end

def find_substrings(string, arr)
  string.chars.each_with_index do |_, i|
    break if string[i..-1].size < 5
    
    length = 5
    until string[i..-1].size < length
      arr << string[i, length]
      length += 1
    end
  end
end

def count_vowel_substrings(string)
  return 0 if string.size < 5

  substrings = []
  find_substrings(string, substrings)
  substrings.delete_if { |substring| substring =~ /[^aeiou]/ }
  substrings.delete_if { |substring| substring.chars.uniq.size < 5 }

  substrings.size
end

p count_vowel_substrings("abcde") #== 0
p count_vowel_substrings("cuaieuouac") #== 7
p count_vowel_substrings("aeiouu") #== 2
p count_vowel_substrings("unicornarihan") #== 0
