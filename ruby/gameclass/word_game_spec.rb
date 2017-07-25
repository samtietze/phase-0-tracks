require_relative 'word_game'

describe WordGame do
  let(:hangman) { WordGame.new("football")}

  it "stores the challenge word given by the first user" do
    expect(hangman.word).to eq "football"
  end

  it "revises the number of guesses based on the challenge word length" do
    expect(hangman.total_guesses).to eq 11
  end

  it "replaces the challenge word with blanks" do
    expect(hangman.game_display).to eq "_ _ _ _ _ _ _ _"
  end

  it "reveals a correctly guessed letter" do
    hangman.user_guess("o")
    expect(hangman.game_display).to eq "_ o o _ _ _ _ _"
  end

  it "mocks the user for guessing incorrectly" do
    expect(hangman.user_guess("z")).to eq "You must be daft"
  end

  it "counts guesses down" do
    hangman.user_guess("z")
    expect(hangman.guesses_left).to eq 10
  end

  it "doesn't count down for repeated guesses" do
    hangman.user_guess("z")
    hangman.user_guess("z")
    expect(hangman.guesses_left).to eq 10
  end

  it "ends the game if the number of guesses reaches 0" do
    hangman.guesses_left = 0
    expect(hangman.is_game_over?).to be true
  end

  it "displays a congratulatory message if the user guesses the word" do
    hangman.game_display == hangman.word
    expect(hangman.you_win).to eq "Congratulations!"
  end


end