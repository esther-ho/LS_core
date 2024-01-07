class GuessingGame
  MAX_GUESSES = 7
  VALID_RANGE = 1..100

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
    @guesses = MAX_GUESSES
    @secret_number = rand(VALID_RANGE)
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
    print "Enter a number between 1 and 100: "

    guess = nil
    loop do
      guess = gets.chomp
      break if valid_guess?(guess)
      print "Invalid guess. Enter a number between 1 and 100: "
    end

    guess.to_i
  end

  def valid_guess?(guess)
    guess =~ /^\d+$/ && VALID_RANGE.include?(guess.to_i)
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

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guess remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
