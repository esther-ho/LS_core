class GuessingGame
  def initialize(min = 1, max = 100)
    @valid_range = min..max
    @guesses = Math.log2(@valid_range.size).to_i + 2
  end

  def play
    reset

    until game_over?
      display_remaining_guesses
      guess = obtain_guess
      compare_guess(guess)
      break if right_guess?(guess)
      @guesses -= 1
    end

    display_game_end
  end

  private

  def reset
    @guesses = Math.log2(@valid_range.size).to_i + 2
    @secret_number = rand(@valid_range)
  end

  def display_remaining_guesses
    string = "\nYou have %d %s remaining."
    if @guesses > 1
      puts format(string, @guesses, 'guesses')
    else
      puts format(string, @guesses, 'guess')
    end
  end

  def obtain_guess
    print "Enter a number between #{@valid_range.min} and #{@valid_range.max}: "

    guess = nil
    loop do
      guess = gets.chomp
      break if valid_guess?(guess)
      print "Invalid guess. Enter a number between #{@valid_range.min} and #{@valid_range.max}: "
    end

    guess.to_i
  end

  def valid_guess?(guess)
    guess =~ /^\d+$/ && @valid_range.include?(guess.to_i)
  end

  def right_guess?(guess)
    guess == @secret_number
  end

  def compare_guess(guess)
    if guess > @secret_number
      puts "Your guess is too high."
    elsif guess < @secret_number
      puts "Your guess is too low."
    else
      puts "That's the number!"
    end
  end

  def game_over?
    @guesses == 0
  end

  def display_game_end
    puts
    puts (game_over? ? "You have no more guesses. You lost!" : "You won!")
  end
end

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!
