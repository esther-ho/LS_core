=begin
Input: a text file with %{...} strings
Output: output of the modified text file, where:
- random words of the appropriate text are added into the text

Rules:
- Replacement words can be reused

--- E
The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

'sleepy' and 'licks' are used twice

--- D
Input: a text file with %{...} strings
In-between:
- a hash where,
  - keys are symbols representing the types of words
  - values are arrays containing words of that type
Output: output of a modified text file

--- A
- Initialize a hash, where:
  - keys are symbols representing the types of words
  - values are arrays containing a list of words of that type
- Read the text file
- Replace any %{...} strings
  - For each string, replace it with a word randomly selected from the specific list
- Print the modified text file
=end

def madlibs(text)
  words_hash = {
    adjective: %w(quick lazy sleepy ugly),
    noun: %w(fox dog head leg),
    verb: %w(jumps lifts bites licks),
    adverb:%w(easily lazily noisily excitedly)
  }

  text = text.each_line do |line| 
    puts line % words_hash.transform_values(&:sample)
  end
end

text = File.read('madlibs.txt')
madlibs(text)
