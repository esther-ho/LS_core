=begin
--- P
Input: one or two integers
  - one represents a single verse
  - two represents the range of verses
Output: a string, corresponding to the verses of the song
Rules:
- All verses have the same lines, with the number of bottles changed, except for the last verse
- If given multiple integers, the integers do not have to be consecutive
Class needs:
- ::verse takes one integer and prints the specific lyrics
- ::verses take multiple integers and prints the specific lyrics
- ::lyrics prints the whole song
--- E

--- D
Input: integer
Output: string
--- A
- Create a string template for the lyrics
- Generate the lyrics of the 99 Bottles of Beer song
  - Iterate from 99 down to 0
  - Interpolate the appropriate number into the lyric from 99 to 1
  - At 0, print the additional ending lyric
- Given a single integer,
  - Print the appropriate lyric based on the verse
- Given multiple integers,
  - Print the appropriate lyrics from the first given to last given verse
=end

class Verse
  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case @bottles
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{@bottles} bottles of beer on the wall, #{@bottles} bottles of beer.\n" \
      "Take one down and pass it around, #{@bottles - 1} bottles of beer on the wall.\n"
    end
  end
end

class BeerSong
  def self.verse(bottles)
    Verse.new(bottles).single_verse
  end

  def self.verses(first, last)
    range = (last..first).to_a.reverse
    range.map { |line| verse(line)  }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
