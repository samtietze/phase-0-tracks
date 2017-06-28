# Creating a form using Ruby that allows
# users to store both keys and their values in
# a hash.
  # This could be looped, but the instructions
  # indicate it's unnecessary.
  # User needs to input client name, age, children
  # decor theme, etc.
    # Since no loop, fill out the hash's
    # keys ahead of time; like a proper form.
# The keys should all be entered as symbols.
# Once the form has been completed, all
# of its values should be printed back to the user.

# Prompt the user for any updates once the form
# has been completed. If the user enters "yes" or
# other affirmative:
  # Transfer the user's input to a symbol (assume
  # no mistakes will be made), and then let them
  # enter a new value for that key.
  # Print the final version!

puts "Please enter your client's name:"
client_name = gets.chomp
puts "Please enter your client's age:"
client_age = gets.chomp.to_i
puts "Please enter the number of children in this household:"
child_count = gets.chomp.to_i
puts "Please provide a decor style the client wishes to use"
style = gets.chomp
puts "Does the client need drapes?"
client_windows = gets.chomp
puts "Are the client's floors carpeted?"
client_floors = gets.chomp

if client_windows.include?("no")
  client_windows = false
else
  client_windows = true
end
if client_floors.include?("no")
  client_floors = false
else
  client_floors = true
end

design_form = {
  name: "#{client_name}",
  age: client_age,
  children: child_count,
  decor_theme: "#{style}",
  drapes: (nil if client_windows == false),
  carpet: (nil if client_floors == false),
}
design_form.delete_if {|key, value| value.nil?}
p design_form