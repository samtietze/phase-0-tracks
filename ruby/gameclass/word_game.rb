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

  attr_accessor :word, :game_display, :guesses_left, :game_over, :list_of_guesses


  def initialize(word)
    @word = word
    @hidden_word = word.split("")
    @game_display = @hidden_word.map { |letter| letter = "_"}.join(" ")
    @guesses_left = word.length + 3
    @game_over = false
    @list_of_guesses = []
  end

  def user_guess(letter)
    # Check against repeat entries
    if !@list_of_guesses.include?(letter)
      # Instead of checking against @word, I'm
      # checking @hidden_word because if the
      # user returns a blank entry it is
      # somehow counted against them!
      if @hidden_word.include?(letter)
        i = 0
        # Loop due to repeating letters in a word
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
        "Good show"
      elsif !@word.include?(letter)
        @guesses_left -= 1
        @list_of_guesses << letter
        "You must be daft"
      end

    elsif @list_of_guesses.include?(letter)
      "You already tried that letter, human."
    end
  end

  def is_game_over?
    if @guesses_left == 0
      @game_over = true
    end
    @game_over
  end

  def you_win
    "Congratulations!"
  end

end

# hangman = WordGame.new("football")
# p hangman.word
# p hangman.total_guesses
# p hangman.game_display
# p hangman.is_game_over?

# p hangman.user_guess("o")
# p hangman.game_display
# p hangman.guesses_left
# p hangman.user_guess("c")
# p hangman.user_guess("c")
# p hangman.user_guess("d")
# p hangman.game_display
# p hangman.guesses_left


# user interface

puts "Hello, human. I bet you think you're smart. Let's find out."
puts "First, have your smarter friend type in a word:"
challenge = gets.chomp.downcase
40.times {puts ()}
hangman = WordGame.new(challenge)

puts "You have #{hangman.guesses_left} turns to figure out what word your friend entered. Don't worry, if you guess the same letter twice, it won't count against you. Though we will make fun of you, I'm sure."
p hangman.game_display

until hangman.is_game_over?
  puts "Please enter a letter:"
  guess = gets.chomp.downcase
  p hangman.user_guess(guess)
  break if hangman.game_display.delete(" ") == hangman.word
  break if hangman.is_game_over?
  2.times {puts ()}
  p hangman.game_display, "You have #{hangman.guesses_left} guesses left. Tick tock."
end
2.times {puts ()}

puts hangman.you_win, "The word was #{hangman.word}." if !hangman.is_game_over?
puts "You lose. Told you your friend was smarter than you. Final game:", hangman.game_display, "The word was #{hangman.word}" if hangman.is_game_over?
