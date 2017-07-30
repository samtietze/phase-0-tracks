# Iron Throne Predictor

# First, we need to get SQLite into the program, and make
# some commands for creating the database as well as the
# tables. Once these commands are written, inserting data
# can be performed.

require 'sqlite3'

thronesdb = SQLite3::Database.new("thronesdb.db")
thronesdb.results_as_hash = true

create_characters_table = <<-SQL
  CREATE TABLE IF NOT EXISTS characters(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    first_seen VARCHAR(255),
    allegiance_value INT,
    allegiance_id INT,
    alive BOOLEAN,
    FOREIGN KEY (allegiance_id) REFERENCES houses(id)
  )
SQL

create_houses_table = <<-SQL
  CREATE TABLE IF NOT EXISTS houses(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    leader_id INT,
    house_value INT,
    FOREIGN KEY (leader_id) REFERENCES characters(id)
  )
SQL

create_strongholds_table = <<-SQL
  CREATE TABLE IF NOT EXISTS strongholds(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    stronghold_value INT,
    house_affiliation_id INT,
    FOREIGN KEY (house_affiliation_id) REFERENCES houses(id)
  )
SQL

thronesdb.execute(create_characters_table)
thronesdb.execute(create_houses_table)
thronesdb.execute(create_strongholds_table)

# thronesdb.execute("INSERT OR IGNORE INTO characters (name, first_seen, allegiance_value, allegiance_id, alive) VALUES ('Robert Baratheon', 'Season 1', 0, 1, 'false')")

# Now a method that will do this repeatedly for entered
# character data.
# INPUT: the database, character name, character's debut,
# the 'value' of the character as an integer, the house
# the character is allied with, and whether the character
# is even still alive:
# No current need for output.

def insert_character(db, name, debut, value, allegiance, alive)
  db.execute("INSERT OR IGNORE INTO characters (name, first_seen, allegiance_value, allegiance_id, alive) VALUES (?, ?, ?, ?, ?)", [name, debut, value, allegiance, alive])
end

# insert_character(thronesdb, "Robert Baratheon", "Season 1", 0, 2, "false")
# insert_character(thronesdb, "Stannis Baratheon", "Season 2", 0, 2, "false")
insert_character(thronesdb, "Cersei Lannister", "Season 1", 5, 1, "true")
insert_character(thronesdb, "Jaime Lannister", "Season 1", 5, 1, "true")

# Now a method for both the houses and the strongholds
# that takes in arguments for each of those tables'
# various columns.
# No current need for output.

def insert_stronghold(db, name, value, house_affiliation_id)
  db.execute("INSERT OR IGNORE INTO strongholds (name, stronghold_value, house_affiliation_id) VALUES (?, ?, ?)", [name, value, house_affiliation_id])
end

def insert_house(db, name, leader_id)
  db.execute("INSERT OR IGNORE INTO houses (name, leader_id, house_value) VALUES (?, ?, 0)", [name, leader_id])
end

# Let's test these out:
insert_stronghold(thronesdb, "King's Landing", 10, 1)

insert_house(thronesdb, "House Lannister", 1)


characters = thronesdb.execute("SELECT * FROM characters")
strongholds = thronesdb.execute("SELECT * FROM strongholds")
houses = thronesdb.execute("SELECT * FROM houses")
# p characters
# p strongholds
# p houses

# p characters[0].keys[8].class
# Now that we have a complete "set", that is a character
# with a value, a stronghold with a value, and both of
# these elements associated with one house (Lannister),
# we can add together the values so House Lannister should
# see a total "test" value of 15.

characters = characters.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}
strongholds = strongholds.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}
houses = houses.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}


# ===========================
# This isn't working. Forgot to account for multiple hashes
# in an array! Stupid mistake. Will need to come back to
# figure this issue out. For now, we will use String keys!


# Before we get to work, we should clear up these hashes
# and convert the keys to symbols to make the CPU happy:
  # The characters variable, at index 0, needs to
  # have the duplicated integer keys removed.

# Now that the unnecessary keys are gone, we need to
# iterate through the array of arrays and make them into
# a hash table. Thankfully, each key can be converted into
# a symbol now.
# characters = Hash[characters.map {|column, row| [column.to_sym, row]}]


# strongholds = Hash[strongholds[0].delete_if {|column, row| column.class == Fixnum}.map{|column, row| [column.to_sym, row]}]

# houses = Hash[houses[0].delete_if {|column, row| column.class == Fixnum}.map {|column, row| [column.to_sym, row]}]

# ==========================


# The value of the house should be updated for every
# character that is allied with that house, and for every
# stronghold that belongs to that house.
# One difficulty that might come up is re-adding a character
# or stronghold's value to the house over and over.
# Input: thrones database, characters hash, strongholds hash
# No explicit output
# Method will use Ruby to add up the values of chars/castles
# and then SQL to update the values in the houses table.
def house_value_calc(db, chars, castles)
  lannister = 0
  stark = 0
  targaryan = 0

  chars.each do |character|
    if character["allegiance_id"] == 1
      lannister += character["allegiance_value"]
    elsif character["allegiance_id"] == 2
      stark += character["allegiance_value"]
    elsif character["allegiance_id"] == 3
      targaryan += character["allegiance_value"]
    end
  end
  castles.each do |castle|
    if castle["house_affiliation_id"] == 1
      lannister += castle["stronghold_value"]
    elsif castle["house_affiliation_id"] == 2
      stark += castle["stronghold_value"]
    elsif castle["house_affiliation_id"] == 3
      targaryan += castle["stronghold_value"]
    end
  end

  db.execute("UPDATE houses SET house_value=#{lannister} WHERE name='House Lannister'")
  db.execute("UPDATE houses SET house_value=#{stark} WHERE name='House Stark'")
  db.execute("UPDATE houses SET house_value=#{targaryan} WHERE name='House Targaryan'")
end

2.times{puts()}
house_value_calc(thronesdb, characters, strongholds)


characters = thronesdb.execute("SELECT * FROM characters")
strongholds = thronesdb.execute("SELECT * FROM strongholds")
houses = thronesdb.execute("SELECT * FROM houses")
p characters
p strongholds
p houses