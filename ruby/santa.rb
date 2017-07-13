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

# santa = Santa.new("agender", "black")
# santa.speak
# santa.eat_milk_and_cookies("snickerdoodle")

santas = []
genders = ["male", "female", "agender", "bigender", "gender is a social construct", "N/A"]
ethnicities = ["caucasion", "hispanic", "black", "Chinese", "Japanese", "Indian"]

genders.length.times do
  puts "Here comes Santa"
  santas << Santa.new(genders.sample, ethnicities.sample)
  santas.sample.speak
end
p santas


