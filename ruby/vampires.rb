
# Adding some quick questions:
# What is your name?
# How old are you?
# What year were you born?
# Do you want some garlic bread?
# Would you like to enroll in our health insurance plan?

# We'll be asking the user a number of questions (see above) in order to make use of their input later.
#   - From the user we'll receive names that we will check against "known vampires" in the area.
#     - Look out for issues with capitalization here.
#   - We'll receive the user's age, as an integer, but then we also must compare that age against the year the user was born.
#     - As long as we do the math right, the check can simply be that the end result is zero.
#   - We will ask a couple of yes or no questions.
#     - Whether a user wants garlic bread will evaluate as true or false.
#        - This is tough because we need to call this out right away!
#     - Whether a user wants health insurance will evaluate as true or false.
# All of these questions will need to be assigned to variables in order to work with them later.
#   - Some results will equate to a final "else" statement indicating the results were inconclusive.

puts "How many employees are taking the survey today?"
employees = gets.chomp
survey = 0

while survey < employees.to_i
  puts "Welcome to Werewolf, Inc. We here at Werewolf, Inc. are excited to get to know you. Please take a moment to answer the following questions:"
  puts "• What is your name?"
  vampname = gets.chomp
  vampname.downcase!

  puts "• How old are you?"
  age = gets.chomp

  puts "• Specifically, what year were you born?"
  birthyear = gets.chomp

  puts "• Our employee cafeteria serves some bomb garlic bread, and it just came out of the oven. Should we order some for you?"
  garliclover = gets.chomp
  garliclover.downcase!

  if garliclover.include?("yes")
    garliclover = true
  elsif garliclover.include?("no")
    garliclover = false
  end

  puts "We here at Werewolf, Inc. want to make sure that all of our employees have access to the kind of healthcare that keeps us confident in our beating hearts.
• Would you like to enroll in our group health insurance policy?"
  insurance = gets.chomp
  insurance.downcase!

  if insurance.include?("yes")
    insurance = true
  elsif insurance.include?("no")
    insurance = false
  end

  allergies = ""
  until allergies.include?("done")
    puts "Please provide any allergies that we should be aware of. Please type 'done' when complete."
    allergies = gets.chomp
    allergies.downcase!
    if allergies.include?("sunshine")
      break
    end
  end

# debug output dump to follow
# puts "#{vampname}, #{age}, #{birthyear}, #{garliclover}, #{insurance}"

# Once the initial variable answers are collected, we need to evaluate them against AND with each other.
#   This will need to result in:
# If the user enters their age correctly, and they want garlic bread or health insurance: they're probably not a vampire.
# If the user doesn't input their correct age, and they hate garlic OR waive health insurance: they're probably a vampire.
# If the user enters their age incorrectly, and they hate garlic, and they also waive the insurance: they're almost certainly a vampire.
# Beyond these three comparisons we have some additional criteria to consider.
#   - If the employee's name matches some of the "known vampire" names, we will evaluate to "Definitely a vampire"
# If none of these conditions match, we'll print "Results inconclusive"

  t = Time.new
  t.year # provides current year
  t.year - age.to_i == birthyear.to_i
  if t.year - age.to_i == birthyear.to_i
    correct_age = true
  else
    correct_age = false
  end

# debug dump to follow
# p correct_age

  puts case
  when vampname === "drake cula" || vampname === "tu fang"
    "Definitely a vampire."
  when allergies.include?("sunshine")
    "Probably a vampire."
  when correct_age && (garliclover || insurance)
    "Probably not a vampire."
  when !correct_age && !garliclover && !insurance
    "Almost certainly a vampire."
  when !correct_age && (!garliclover || !insurance)
    "Probably a vampire."
  else
    puts "Results inconclusive."
  end

# Now we need to loop the entire survey in order to process multiple employees.
# Creating a vairable at the beginning that will slowly count upwards should allow us to establish an until loop.
#   - We will need to implement an additional user input value for the number of employees.

  survey += 1
end

# The next section of the program will run above this pseudocode. We are heading back into the loop in order to ask for a list of allergies.
  # - If the user enters "sunshine" we should break to an additional while statement that evaluates the "allergies" variable. If this is the case, all other input is ignored (kind of like if the user's name is Drake Cula or Tu Fang).
  # Once the loop is complete, the normal operation may resume!