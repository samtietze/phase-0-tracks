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
  swap_chars = swap.chars
  # Now we need a couple of letter-specific arrays
  # in order to run comparison operators between
  # each element at each index point.
  vowels = %w(a e i o u)
  consonants = %w(b c d f g h j k l m n p q r s t v x y z)
  i = 0
  spy_name = [] # Shoveling into this array.
  swap_chars.each do
    # We must determine if the character is in the
    # vowel or the consonant array.
    # Then we need to find its index and move it
    # to the next one.
    # The edge cases in this operation are quite
    # annoying. Since each array has a final
    # element, each array has to be equipped
    # with a control flow statement:
    if vowels.include?(swap_chars[i])
      x = vowels.index(swap_chars[i]) + 1
      if vowels[x].nil? # i.e. "u"
        spy_name << vowels[0]
      else
        spy_name << vowels[x]
      end
      i += 1
    elsif consonants.include?(swap_chars[i])
      x = consonants.index(swap_chars[i]) + 1
      if consonants[x].nil? # i.e. "z"
        spy_name << consonants[0]
      else
        spy_name << consonants[x]
      end
      i += 1
    # Could not get this section work appropriately:
    # elsif swap_chars[i] == "-"
    #   spy_name << "-"
    #   i += 1
    else
      spy_name << " "
      i += 1
    end
  end
# remember to capitalize result

  # Here we re-join the final name by bringing each
  # letter from the array back into two separate
  # words. This is then how we capitalize only
  # the first letters of each string.

  # Capitalizing each item in turn requires
  # a proc object to be created. Thanks to
  # the & shorthand, this Symbol#to_proc is
  # nice and easy. It will run a capitalize method
  # on any element in the array that will take it.
  # In this case it'll capitalize the first and
  # last names. However, I don't know how to handle
  # the edge case of an Arabic suffix that remains
  # lower-case ("al-" or "ibn" or "bin").

  final = spy_name.join.split.map(&:capitalize)*(' ')
end
p alias_manager(real_name)