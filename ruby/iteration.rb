# Release 0
def say_hello
  puts "Hi"
  name_1 = "John"
  name_2 = "Jane"
  name_3 = "Joe"
  yield(name_1, name_2, name_3)
  puts "Thanks so much!"
end

say_hello {|name_1, name_2, name_3| puts "#{name_1}, #{name_2}, #{name_3}"}

# Release 1
fruits = ["apple", "banana", "orange", "kiwi", "watermelon"]
favorite_food = {
  Jane: "spaghetti",
  Joe: "chicken",
  Bob: "sandwich",
  Sam: "pizza",
  Marissa: "mac and cheese"
}
puts fruits
fruits.each_with_index {|fruit, index| puts "#{index+1}. #{fruit}"}
puts fruits
fruits.map! {|fruit| p "#{fruit}" + "! "}
puts fruits
puts favorite_food
favorite_food.each {|name, food| puts "#{name} likes #{food}!"}
puts favorite_food

# Release 2

number_array = [1, 4, 6, 7, 88, 13493, 22, 5, 6778, 33, 6575, 23, 97]

number_hash = {
  a: 1,
  b: 4,
  c: 6,
  d: 7,
  e: 88,
  f: 13493,
  g: 22,
  h: 5,
  i: 6778,
  j: 33,
  k: 6575,
  l: 23,
  m: 97
}


number_array.delete_if {|number| number < 22}
puts number_array

number_hash.delete_if {|letter, number| number < 22}
puts number_hash

number_array.reject! {|number| number > 88}
puts number_array

number_hash.keep_if {|letter, number| number <= 88}
puts number_hash

number_array.keep_if {|number| number < 6000}
puts number_array

number_hash.select {|letter, number| number < 88}
puts number_hash

puts number_array.take_while {|number| number == 88}
number_hash.delete {|letter, n}