# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
=> “InVeStIgAtIoN”

"zom".insert(1, "o")
=> “zoom”

"enhance".rjust(11).ljust(15)
=> "    enhance    "

"Stop! You’re under arrest!".upcase
=> "STOP! YOU’RE UNDER ARREST!"

"the usual".concat(" suspects")
=> "the usual suspects"

" suspects".prepend("the usual")
=> "the usual suspects"

"The case of the disappearing last letter".chop
=> "The case of the disappearing last lette"

"The mystery of the missing first letter".delete("T")
=> "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze(" ")
=> "Elementary, my dear Watson!"

# Accidentally used an array method here...
# "Elementary,    my   dear        Watson!".split(" ").join(" ")
# => "Elementary, my dear Watson!"

"z".ord
=> 122
# (What is the significance of the number 122 in relation to the character z?)
# I don't yet know how this information is used in Ruby, but this is a mathematical concept that indicates sequence.
# Ruby might be using this as a more linguistic-oriented form in order to assist with attaching suffixes to dates and other counters (1 -> 1st, etc.).

"How many times does the letter 'a' appear in this string?".count("a")
=> 4