# Nested data
# I'm unoriginal, so let's build a coffee shop.

coffee_shop = {
  first_location: {
    address: '123 Fake Street',
    seating: {
      fire_code_restriction: 20,
      lounge_area: false,
      for_here_mugs: false
    },
    coffee_in_stock: [
      "Light Roast",
      "Dark Roast",
      "Espresso"
    ],
    cafe: [
      "Roast Beef Sandwich",
      "Vegetarian Pizza"]
  },
  second_location: {
    address: '50000 N Washington Ave',
    seating: {
      fire_code_restriction: 100,
      lounge_area: false,
      for_here_mugs: true
    },
    coffee_in_stock: [
      "Light Roast",
      "Espresso"
    ],
    cafe: false
  },
  third_location: {
    address: '8080 Real Pkwy',
    seating: {
      fire_code_restriction: 150,
      lounge_area: true
    },
    for_here_mugs: true,
    coffee_in_stock: [
      "Light Roast", "Espresso"
    ],
    cafe: true
  }
}

p coffee_shop[:first_location][:seating][:fire_code_restriction]
p coffee_shop[:second_location][:coffee_in_stock]
p coffee_shop[:second_location][:address]
p coffee_shop[:first_location][:cafe][1]
p coffee_shop[:third_location][:coffee_in_stock].reverse
p coffee_shop[:second_location][:cafe]