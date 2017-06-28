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

if client_windows.include?("n")
  client_windows = false
else
  client_windows = true
end
if client_floors.include?("n")
  client_floors = false
else
  client_floors = true
end

design_form = {
  name: client_name,
  age: client_age,
  children: child_count,
  decor_theme: style,
  drapes: client_windows,
  carpet: client_floors,
}
design_form.delete_if {|key, value| value == false}
# This will erase the unnecessary values on
# the form. For example, if the client's floors
# are hardwood, there is no need for carpeting.
p design_form

puts "Do you wish to make any changes? Type 'none' if not."
changes = gets.chomp
# Trouble might be encountered from user input
# if the key they choose is tied to a specific
# value like an integer or a string. How to fix?
if changes.downcase.include?("y")
  puts "Which field do you wish to edit?"
  field = gets.chomp
  case
  when field.downcase.to_sym == :name then puts "Please re-enter the client's name:"
    client_name = gets.chomp
    design_form[:name] = "#{client_name}"
  when field.downcase.to_sym == :age then puts "Please re-enter the client's age:"
    client_age = gets.chomp.to_i
    design_form[:age] = client_age
  when field.downcase.to_sym == :children then puts "Please re-enter the number of children in the household:"
    child_count = gets.chomp.to_i
    design_form[:children] = child_count
  when field.downcase.to_sym == :decor_theme then puts "Please re-enter the desired style:"
    style = gets.chomp
    design_form[:decor_theme] = "#{style}"
# Now that the user has a second chance to enter
# the values for the two boolean keys, this is
# a little trickier.
  when field.downcase.to_sym == :drapes then puts "Does the client need drapes?"
    client_windows = gets.chomp
    if client_windows.include?("n")
      client_windows = false
    else
      client_windows = true
    end
    design_form[:drapes] = client_windows
  when field.downcase.to_sym == :carpet then puts "Are the client's floors carpeted?"
    client_floors = gets.chomp
    if client_floors.include?("n")
      client_floors = false
    else
      client_floors = true
    end
    design_form[:carpet] = client_floors
  else puts "Input not recognized."
  end
else
  puts "Thank you for filling out this form."
end
# Now that the user may have made changes to the
# windows or floors values, we'll need to
# re-insert these keys or delete them if they've
# become false.
design_form.delete_if {|key, value| value == false}
p design_form