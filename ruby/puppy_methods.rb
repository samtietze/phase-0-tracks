# # Business Logic

# class Puppy

#   def fetch(toy)
#     puts "The puppy brought back the #{toy}"
#     toy
#   end

#   def speak(number)
#       number.times {print "Woof", " "}
#   end

#   def roll_over
#     puts "Roll Over"
#   end

#   def dog_years(age)
#     p age * 7
#   end

#   def shake_hands_w_paw(name)
#    puts "Puppy, please shake hands with our friend #{name}"
#   end

#   def initialize    #Always spell check initialize. It will create a new print this method anytime a new instance is made
#     puts "Initializing new puppy instance"
#   end

# end



# # Driver Code

# fido = Puppy.new
# fido.fetch("ball")
# puts "Oh yea!"

# spot = Puppy.new
# spot.speak(5)
# puts "- Looking good!"


# winnie = Puppy.new
# winnie.roll_over
# puts "Correcto Mundo!"

# oscar = Puppy.new
# oscar.dog_years(7)
# puts "Math adds up!"

# sparky = Puppy.new
# sparky.shake_hands_w_paw("Allison")
# puts "Shake hands instance works!"


#Aglo for Release 2
#Create a new class - anything
#Create two methods to be used within the class (attribute)
#Initialize method
#Loop through instances of the class (puppy names)
#Create data structure to store data in
#Loop over data structure and call all intances for each iteration



class Cars

  def initialize
    car_types = ["truck", "sedan", "convertabile", "SUV"]
    @name = car_types[rand(0..3)]
    puts "Here is the #{@name}"
  end

  def honk(number)
    number.times { puts "Honk"}
  end

  def capacity(passengers)
     "This #{@name} fits #{passengers}"
  end

end


# truck = Cars.new
# truck.honk(8)
# puts truck.capacity(4)


#Driver Code


car_array = []

50.times do
  car = Cars.new
  car_array << car
end

car_array.each do |x|
  x.honk(rand(1..4))
  puts x.capacity(rand(1..7))
end