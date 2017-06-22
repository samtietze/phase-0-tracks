puts"Please enter your hamsters name:"
hamstername = gets.chomp
valid_input = false
until valid_input
  puts"Please enter the volume_level:"
  hamstervol = gets.chomp
  if hamstervol.to_i.between?(1,10)
    valid_input = true
  elsif puts "Please choose a number BETWEEN 1 and 10"
  end
end
puts"What color is the hamster?"
color =  gets.chomp
puts"Would this hamster be a good candidate for adoption?"
adoption = gets.chomp
puts"What's this hamster's age"
age = gets.chomp
if age == ""
  age = nil
end

puts "Your hamster's name is #{hamstername}. Your hamster's volume is #{hamstervol}. Your hamster is #{color}. Is this hamster adoptable? #{adoption}. This hamster is #{age} years old."