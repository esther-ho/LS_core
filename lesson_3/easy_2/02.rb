=begin
Convert the string into:
- All uppercase except for 1st letter of 1st and 2nd word
- Capitalize only the first word
- All lowercase
- All uppercase
=end

munsters_description = "The Munsters are creepy in a good way."

munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
