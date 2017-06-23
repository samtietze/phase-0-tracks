
# Adding some quick questions:
# What is your name?
# How old are you?
# What year were you born?
# Do you want some garlic bread?
# Would you like to enroll in our health insurance plan?

puts "Welcome to Werewolf, Inc. We here at Werewolf, Inc. are excited to get to know you. Please take a moment to answer the following questions:"
puts "What is your name?"
vampname = gets.chomp

puts "How old are you?"
age = gets.chomp

puts "Specifically, what year were you born?"
birthyear = gets.chomp

puts "Our employee cafeteria serves some bomb garlic bread, and it just came out of the oven. Should we order some for you?"
garlicaversion = gets.chomp

puts "Finally, we here at Werewolf, Inc. want to make sure that all of our employees have access to the kind of healthcare that keeps us confident in our health. Would you like to enroll in our group health insurance policy?"
immortalstate = gets.chomp

# debug output dump to follow
#puts "#{vampname}, #{age}, #{birthyear}, #{garlicaversion}, #{immortalstate}"


# Next match some conditions:
# - correct age && (garlic bread || health insurance)
#   - Probably not a vampire
# - incorrect age && hates garlic && waives insurance)
#   - Almost certainly a vampire
# - If name is "Drake Cula" || "Tu Fang"
#   - Definitely a vampire
# - Else print "Results inconclusive"

# Actual pseudocode?:
# If the user enters their age correctly, and they want garlic bread or health insurance: they're probably not a vampire.
# If the user enters their age incorrectly, and they hate garlic, and they also waive the insurance: they're almost certainly a vampire.

t = Time.new
t.year provides current year
t.year - age.to_i == birthyear.to_i

if t.year - age.to_i == birthyear.to_i
  correct_age = true
else
  correct_age = false
end
