# Release 0
# Here we need to avoid use of built-in methods
# such as '.index'. Consequently, we only have
# access to the built-in methods of.length
# and .each.
  # Since we don't have access to the specific
  # index items, we need to iterate through
  # and check each entry in the array.


test = [2, 4, 6, 8, 10, 12]

def search_array(ary, target)
  # Here we need to start a counter in order to
  # determine what position our loop is in
  # when it finds a match, and then we can
  # accurately print out the index number of
  # the match.
  i = 0
  match = nil # nil in case of no matching target
  ary.each do |x|
    if x == target
      match = i
    else
      i += 1
    end
  end
  p match
end

p test.length
search_array(test, 12)
search_array(test, 23)

# Here we just created an equivalent case
# statement that performs the same actions.
# The code is almost exactly the same.
def search_array2(ary, target)
  i = 0
  match = nil
  ary.each do |x|
    case
    when x == target then match = i
    else i += 1
    end
  end
  p match
end

p test.length
search_array2(test, 10)
search_array2(test, 23)

# Release 1
# Start with a blank array and iterate through
# it to build out the next integers.
# Following the general equation for the Fibonacci
# sequence, we need two variables that will be
# used to create the third number.
  # In order to find the number in the sequence
  # that the user searches for, we have another
  # variable, "n". This will be used later, if the
  # number isn't 0, 1, or 2 (since the sequence
  # begins with 0, 1, 1 in our case).

# Following the first couple of numbers we need
# to use a range that relies on the user's input
# 'n' to find the last number to define in the
# sequence. If n is higher than the first three
# numbers, we simply need to shovel the 0 and 1's
# into the array.
  # Be sure to put the counter outside of the loop!
  # If 'first' and 'second' are inside the loop
  # their values won't increase in each iteration.

def fib(n)

  fib_array = []
  first = 0
  second = 1

  if n == 0
    nil
  elsif n == 1
    fib_array << 0
  elsif n == 2
    fib_array << 1
  else
    fib_array << 0
    fib_array << 1

    (3..n).each do # Due to the zero index of
    # Ruby, we use 3 here to represent the
    # numbers after 0, 1, 1

    next_number = (first + second)
    first = second
    second = next_number

    fib_array << second
    end

  end
  return fib_array

end

# The release indicates we should simply check
# that the 100th number is equal to the provided
# value. This if statement will do:
if fib(100).last == 218922995834555169026
  p fib(100).last
else
  p "Try again, my dude."
end