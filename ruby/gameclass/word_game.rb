# Write a class that is capable of allowing
# its various attributes to be accessed from outside
# the class. One user will input a word to the
# class, and another user will input guesses.

# Since the guesses will "fill in" the blanks if
# they're correct, the second user will need access
# to the instance variable that displays the blanks.

# The second user's amount of guesses are related
# to the length of the word. This doesn't mean it
# needs to equal the length.
  # If the user guesses the same letter again,
  # this shouldn't count against the user.

# Each time the user guesses, the game should print
# out its current status. That is, "_______"
# should become "___e___", etc.

# Once the user has guessed the word successfully
# they should be given a congratulatory message.
# If the user loses, they should get a taunting
# message instead.

class WordGame
  attr_reader :total_guesses
  attr_accessor :word, :game_display, :guesses_left, :game_over, :list_of_guesses


  def initialize(word)
    @word = word
    @total_guesses = word.length + 5
    # @game_display = word.length.times {print "_ "} This won't work. Need an array.
    @hidden_word = word.split("")
    @game_display = @hidden_word.map { |letter| letter = "_"}.join(" ")
    @guesses_left = @total_guesses
    @game_over = false
    @list_of_guesses = []
  end

  def user_guess(letter)
    if !@list_of_guesses.include?(letter)

      if @word.include?(letter)
        i = 0
        @hidden_word.each do
          if @hidden_word[i] == letter
            @game_display[i * 2] = letter
            i += 1
          else
            i += 1
          end
        end
        @list_of_guesses << letter
        @guesses_left -= 1
      elsif !@word.include?(letter)
        @guesses_left -= 1
        @list_of_guesses << letter
        "You must be daft"
      end

    elsif @list_of_guesses.include?(letter)
      "You already tried that letter, human."
    end
  end

  def game_over
    if @guesses_left = 0
      @game_over = true
    end
  end

  def you_win
    "Congratulations!"
  end

end