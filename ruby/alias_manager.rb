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
real_name = gets.chomp.downcase
# real_name = "Zellie Heinz Uruguay".downcase!

def alias_manager(name)
  swap = name.split(' ').reverse.join(' ')
  swap_chars = swap.chars
  # After getting this code working, I've gone back
  # and written a short method that should work for
  # both vowels and consonants. The same pseudo
  # that I wrote out previously should apply here.
  # We need to declare a number var ("x") in order
  # to match it with the vowel/consonant index, but
  # also get the NEXT position in that array.
  def letter_check (ary, alpha, count)
    x = alpha.index(ary[count]) + 1
    if alpha[x].nil? # edge cases such as "u" or "z"
      return alpha[0]
    else
      return alpha[x] # this index item will be shoveled
      # into the spy name array.
    end
  end
  # Now we need a couple of letter-specific arrays
  # in order to run comparison operators between
  # each element at each index point.
  vowels = %w(a e i o u)
  consonants = %w(b c d f g h j k l m n p q r s t v x y z)
  i = 0
  spy_name = [] # Shoveling into this array.
  swap_chars.each do
    # We must determine if the character is in the
    # vowel or the consonant array. It doesn't seem to
    # be any more or less important to have these
    # control flow statements inside the method or
    # used later on in the loop.
    if vowels.include?(swap_chars[i])
      spy_name << letter_check(swap_chars, vowels, i)
    elsif consonants.include?(swap_chars[i])
      spy_name << letter_check(swap_chars, consonants, i)
    # Could not get this section work appropriately with capitalization:
    # elsif swap_chars[i] == "-"
    #   spy_name << "-"
    else
      spy_name << " "
    end
    i += 1
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
  # lower-case ("al-," "ibn," or "bin").

  final = spy_name.join.split.map(&:capitalize)*(' ')
end
p alias_manager(real_name)