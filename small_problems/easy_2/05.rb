=begin
--- P
Inputs:
- User's name
Outputs:
- Without '!': Greeting with the user's name
- With '!': Greeting with the user's name, but screaming
--- E
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
--- D

--- A
- Ask for the user's name and store input
- Check if the input ends with '!'
- If it ends with '!',
  - Remove '!' from name
  - Print name and greeting screaming in all caps
- If not, print name and greeting without screaming
=end

print "What is your name? "
name = gets.chomp

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
