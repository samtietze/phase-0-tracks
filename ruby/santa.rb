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
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    @reindeer_ranking.delete_if {|name| name == "#{reindeer}"}
    @reindeer_ranking.insert(-1, "#{reindeer}")
  end

  def gender=(new_gender)
    @gender = new_gender
  end

end

santa = Santa.new("agender", "black")
santa.speak
santa.eat_milk_and_cookies("snickerdoodle")
santa.celebrate_birthday
santa.get_mad_at("Rudolph")
santa.gender = "male"
p santa


# santas = []
# genders = ["male", "female", "agender", "bigender", "gender is a social construct", "N/A"]
# ethnicities = ["caucasion", "hispanic", "black", "Chinese", "Japanese", "Indian"]

# genders.length.times do
#   puts "Here comes Santa"
#   santas << Santa.new(genders.sample, ethnicities.sample)
#   santas.sample.speak
# end
# p santas


