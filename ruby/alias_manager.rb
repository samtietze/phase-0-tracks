# Release 0
# First we need to turn a string into an array.
# Then we need to feed it into the fake name
# hopper, and turn it into an array. Since
# we're turning it into an array, we shouldn't
# have to worry about any specifics with the name.

# Once the name is in the fake name generator,
# the first and second positions will be swapped.
# Once this is complete, a different split at the
# character level should occur in order to begin
# altering those characters.

puts "Please enter your first and last name:"
real_name = gets.chomp.downcase!

def alias_manager(name)
  swap = name.split(' ').reverse.join(' ')
  swap_chars = swap.split
  vowels = %w(a e i o u)
  consonants = %w(b c d f g h j k l m n p q r s t v x y z)
  i = 0
  spy_name = []
  swap_chars.each do #|vowel, consonant|
    # We must determine if the character is in the
    # vowel or the consonant array.
    # Then we need to find its index and move it
    # to the next one.
    if vowels.include?(swap_chars[i])
      spy_name << vowels[swap_chars[i] +1 ]
    elsif consonants.include?(swap_chars[i])
      spy_name << consonants[swap_chars[i] +1 ]
    end
    # swap_chars.select {|vowel| vowel =~ /[aeiou]/}
  end
end

# remember to capitalize result
p alias_manager(real_name)