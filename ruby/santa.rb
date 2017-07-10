class Santa
  def speak
    puts "Ho, ho, ho! Haaaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
  end

  reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  age = 0
end

santa = Santa.new("agender", "black")
santa.speak
santa.eat_milk_and_cookies("snickerdoodle")