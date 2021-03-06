#grocery list

# -add item (quantities)
# -remove item
# -update quantities
# -print list-fancy
# -array vs hash
# -!! what's passed in vs return value

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza") [carrots, apples , cereal, pizza]
# steps:
  # create a method that passes in a list of items
  # split up each item from list
  # each item from list will become the KEY element for the grocery list
  # set default quantity to 1 as we create each KEY
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?] Hash

def create_list(list)
  grocery_list = {}

  list.split(" ").each do |item|
    grocery_list[item] = 1
  end

  grocery_list
end

grocery_list = create_list("carrots apples cereal")

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: append list with and quantity as VALUE
# output: list in HASH form
#method_add(list, carrot, qty)

def add_item(list, item, qty = 1)
  list[item] = qty

  list
end

p add_item(grocery_list, "onion")


# Method to remove an item from the list
# input: list, item name to remove
# steps: check the KEYs in HASH using destructive method to match and delete
# output: list in HASH form

def remove_item(list, item)
  # list.delete_if do |grocery_item, qty|
  #   grocery_item == item
  # end
  list.delete(item)

  list
end

# remove_item(grocery_list, "orange")


# Method to update the quantity of an item
# input: list, item name to update, qty to remove/add
# steps: compare each item on list to the item to search for
# once item is found, update quantity
# output: list in HASH form

def change_quantity(list, item, qty)
  list[item] = qty
  list
end
# Think about how to check against user error
p change_quantity(grocery_list, "cereal", 5)


# Method to print a list and make it look pretty
# input: list
# steps: convert KEYS to STRINGS and add readable syntax before each VALUE
# output: list in fancy readable HASH form

def pretty_list(list)
  list.each do |grocery_item, qty|
    puts "#{grocery_item}, quantity: #{qty}"
  end
end

pretty_list(grocery_list)

# Sam's Reflection:
# What did you learn about pseudocode from working on this challenge?
# Our guide's feedback was pretty helpful here, in
# that we realized we were hunting down methods for
# hashes or arrays while we were laying out our
# pseudo, and by the time we got to actually writing
# the methods, we ended up not even using those
# methods. So our pseudo was prepping us for
# strategies we didn't end up taking. It was a good
# reminder that we should start by laying out what
# we want to do, not really how we will accomplish
# it.

# What are the tradeoffs of using arrays and hashes for this challenge?
# We found that arrays were necessary data structures
# in some situations, but ultimately all of our
# methods pushed out hashes. I'm sure there are other
# ways to write this code, but the only time we used
# arrays was due to needing .split(" ").

# What does a method return?
# Whatever we tell it to return.

# What kind of things can you pass into methods as arguments?
# Everything?

# How can you pass information between methods?
# If the return value of a method is something you
# need in another method, you can call multiple
# methods, or you can pass a method in as an
# argument for another method. You can even call
# a method from within another method.

# What concepts were solidified in this challenge, and what concepts are still confusing?
# We didn't end up nesting any methods, though
# it strikes me as something that could be done
# to streamline the process in some situations.
# Looking back at the methods, I'm really not
# sure where I'd even nest one!
