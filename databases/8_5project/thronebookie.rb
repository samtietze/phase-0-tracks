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

# ====================
# Time to copy over the Character and Castle
# data. Each come in the form of "driver code"
# rather than iterated-upon arrays. Both
# approaches makes sense, but after speaking
# with my advisor, I don't believe either are
# really worth approaching over the other.

# Since characters and strongholds are changing
# throughout the show, I felt that running each
# method individually was an accurate reflection
# of how new characters would be entered into this
# database were we to start from season 1.

2.times{puts()}

insert_character(thronesdb, "Tyrion Lannister", "Season 1", 5, 3, "true")
insert_character(thronesdb, "Daenarys Targaryen", "Season 1", 5, 3, "true")
insert_character(thronesdb, "Jon Snow", "Season 1", 5, 2, "true")
insert_character(thronesdb, "Petyr Baelish", "Season 1", 5, 2, "true")
insert_character(thronesdb, "Jorah Mormont", "Season 1", 5, 3, "true")
insert_character(thronesdb, "Sansa Stark", "Season 1", 5, 2, "true")
insert_character(thronesdb, "Arya Stark", "Season 1", 5, 2, "true")
insert_character(thronesdb, "Theon Greyjoy", "Season 1", 3, 3, "true")
insert_character(thronesdb, "Bran Stark", "Season 1", 5, 2, "true")
insert_character(thronesdb, "The Hound", "Season 1", 5, 0, "true")
insert_character(thronesdb, "Joffrey Baratheon", "Season 1", 5, 1, "false")
insert_character(thronesdb, "Catelyn Stark", "Season 1", 5, 1, "false")
insert_character(thronesdb, "Robb Stark", "Season 1", 5, 1, "false")
insert_character(thronesdb, "Khal Drogo", "Season 1", 5, 3, "false")
insert_character(thronesdb, "Ned Stark", "Season 1", 5, 2, "false")
insert_character(thronesdb, "Robert Baratheon", "Season 1", 5, 1, "false")
insert_character(thronesdb, "Viserys Targaryen", "Season 1", 5, 3, "false")
insert_character(thronesdb, "Varys", "Season 1", 5, 3, "true")
insert_character(thronesdb, "Samwell Tarly", "Season 1", 5, 2, "true")
insert_character(thronesdb, "Bronn", "Season 1", 5, 1, "true")
insert_character(thronesdb, "Tywin Lannister", "Season 1", 5, 1, "false")
insert_character(thronesdb, "Jeor Mormont", "Season 1", 5, 0, "false")
insert_character(thronesdb, "Gendry", "Season 1", 5, 0, "true")
insert_character(thronesdb, "Tommen Baratheon", "Season 1", 3, 1, "false")
insert_character(thronesdb, "Davos Seaworth", "Season 2", 5, 3, "true")
insert_character(thronesdb, "Melisandre", "Season 2", 5, 3, "true")
insert_character(thronesdb, "Margaery Tyrell", "Season 2", 5, 1, "false")
insert_character(thronesdb, "Stannis Baratheon", "Season 2", 5, 0, "false")
insert_character(thronesdb, "Ygritte", "Season 2", 5, 0, "false")
insert_character(thronesdb, "Talisa Maegyr", "Season 2", 1, 2, "false")
insert_character(thronesdb, "Brienne of Tarth", "Season 2", 5, 2, "true")
insert_character(thronesdb, "Gilly", "Season 2", 1, 2, "true")
insert_character(thronesdb, "Roose Bolton", "Season 2", 5, 1, "false")
insert_character(thronesdb, "Tormund Giantsbane", "Season 3", 5, 2, "true")
insert_character(thronesdb, "Ramsay Bolton", "Season 3", 5, 1, "false")
insert_character(thronesdb, "Daario Naharis", "Season 3", 5, 3, "true")
insert_character(thronesdb, "Missandei", "Season 3", 5, 3, "true")
insert_character(thronesdb, "Ellaria Sand", "Season 4", 5, 3, "true")

insert_character(thronesdb, "The Mountain", "Season 1", 5, 1, "true")
insert_character(thronesdb, "Grand Maester Pycelle", "Season 1", 3, 1, "false")
insert_character(thronesdb, "Loras Tyrell", "Season 1", 2, 1, "false")
insert_character(thronesdb, "Hodor", "Season 1", 3, 2, "false")
insert_character(thronesdb, "Alliser Thorne", "Season 1", 1, 1, "false")
insert_character(thronesdb, "Othell Yarwyck", "Season 1", 1, 4, "false")
insert_character(thronesdb, "Myrcella Baratheon", "Season 1", 1, 1, "false")
insert_character(thronesdb, "Kevan Lannister", "Season 1", 1, 1, "false")
insert_character(thronesdb, "Lancel Lannister", "Season 1", 1, 1, "false")
insert_character(thronesdb, "Osha", "Season 1", 3, 2, "false")
insert_character(thronesdb, "Rickon Stark", "Season 1", 1, 2, "false")
insert_character(thronesdb, "Rodrik Cassel", "Season 1", 3, 2, "false")
insert_character(thronesdb, "Meryn Trant", "Season 1", 3, 1, "false")
insert_character(thronesdb, "Maester Aemon", "Season 1", 3, 4, "false")
insert_character(thronesdb, "Barristan Selmy", "Season 1", 5, 3, "false")
insert_character(thronesdb, "Maester Luwin", "Season 1", 3, 2, "false")
insert_character(thronesdb, "Podrick Payne", "Season 2", 3, 2, "true")
insert_character(thronesdb, "Eddison Tollett", "Season 2", 5, 4, "true")
insert_character(thronesdb, "Yara Greyjoy", "Season 2", 5, 3, "true")

insert_character(thronesdb, "Grey Worm", "Season 3", 5, 3, "true")
insert_character(thronesdb, "Qyburn", "Season 3", 5, 1, "true")
insert_character(thronesdb, "Olenna Tyrell", "Season 3", 5, 3, "true")
insert_character(thronesdb, "Meera Reed", "Season 3", 4, 2, "true")
insert_character(thronesdb, "Jojen Reed", "Season 3", 2, 2, "false")
insert_character(thronesdb, "Olly", "Season 4", 1, 4, "false")
insert_character(thronesdb, "Mace Tyrell", "Season 4", 1, 1, "false")
insert_character(thronesdb, "Bowen Marsh", "Season 5", 1, 4, "false")
insert_character(thronesdb, "Thoros of Myr", "Season 3", 3, 5, "true")
insert_character(thronesdb, "Tyene Sand", "Season 5", 2, 3, "true")
insert_character(thronesdb, "Nymeria Sand", "Season 5", 2, 3, "false")
insert_character(thronesdb, "Obara Sand", "Season 5", 2, 3, "false")
insert_character(thronesdb, "Robin Arryn", "Season 1", 3, 2, "true")
insert_character(thronesdb, "Edmure Tully", "Season 3", 1, 2, "true")
insert_character(thronesdb, "Beric Dondarrion", "Season 1", 5, 5, "true")
insert_character(thronesdb, "Brynden Tully", "Season 3", 3, 2, "false")
insert_character(thronesdb, "Yoren", "Season 1", 1, 4, "false")
insert_character(thronesdb, "Kovarro", "Season 2", 1, 3, "true")
insert_character(thronesdb, "Yohn Royce", "Season 4", 3, 2, "true")
insert_character(thronesdb, "Walder Frey", "Season 1", 3, 1, "false")
insert_character(thronesdb, "Anguy", "Season 3", 2, 5, "true")
insert_character(thronesdb, "Lyanna Mormont", "Season 6", 3, 2, "true")
insert_character(thronesdb, "Benjen Stark", "Season 1", 3, 2, "true")
insert_character(thronesdb, "Euron Greyjoy", "Season 6", 5, 1, "true")
insert_character(thronesdb, "Robett Glover", "Season 6", 2, 2, "true")
insert_character(thronesdb, "Maester Wolkan", "Season 6", 1, 2, "true")
insert_character(thronesdb, "Ilyn Payne", "Season 1", 2, 1, "true")
insert_character(thronesdb, "Randyll Tarly", "Season 6", 2, 1, "true")
insert_character(thronesdb, "Dickon Tarly", "Season 6", 1, 1, "true")
insert_character(thronesdb, "Alys Karstark", "Season 7", 2, 2, "true")
insert_character(thronesdb, "Ned Umber", "Season 7", 2, 2, "true")
insert_character(thronesdb, "Kinvara", "Season 6", 3, 3, "true")
insert_character(thronesdb, "Dim Dalba", "Season 6", 1, 2, "true")
insert_character(thronesdb, "Donnel Waynwood", "Season 4", 1, 2, "true")
insert_character(thronesdb, "Hallyne", "Season 2", 2, 1, "true")
insert_character(thronesdb, "Illyrio Mopatis", "Season 1", 1, 3, "true")
insert_character(thronesdb, "Wyman Manderly", "Season 6", 1, 2, "true")
insert_character(thronesdb, "Cley Cerwyn", "Season 6", 1, 2, "true")
insert_character(thronesdb, "Denys Mallister", "Season 5", 1, 4, "true")
insert_character(thronesdb, "Anya Waynwood", "Season 4", 1, 2, "true")
insert_character(thronesdb, "Vance Corbray", "Season 4", 1, 2, "true")
insert_character(thronesdb, "Vance Corbray", "Season 4", 1, 2, "true")

insert_stronghold(thronesdb, "Winterfell", 10, 2)
insert_stronghold(thronesdb, "Castle Black", 10, 4)
insert_stronghold(thronesdb, "The Eyrie", 10, 2)
insert_stronghold(thronesdb, "The Twins", 5, 2)
insert_stronghold(thronesdb, "Dragonstone", 10, 3)
insert_stronghold(thronesdb, "Pyke", 5, 1)
insert_stronghold(thronesdb, "Harrenhal", 5, 2)
insert_stronghold(thronesdb, "Riverrun", 5, 1)
insert_stronghold(thronesdb, "The Deadfort", 0, 2)
insert_stronghold(thronesdb, "Meereen", 0, 3)
insert_stronghold(thronesdb, "Moat Cailin", 2, 2)
insert_stronghold(thronesdb, "Castle Cerwyn", 5, 2)
insert_stronghold(thronesdb, "Deepwood Motte", 5, 2)
insert_stronghold(thronesdb, "Greywater Watch", 1, 2)
insert_stronghold(thronesdb, "Hornwood", 1, 2)
insert_stronghold(thronesdb, "Karhold", 5, 2)
insert_stronghold(thronesdb, "Last Hearth", 5, 2)
insert_stronghold(thronesdb, "Runestone", 5, 2)
insert_stronghold(thronesdb, "Raventree Hall", 5, 2)
insert_stronghold(thronesdb, "Stone Hedge", 5, 2)

insert_stronghold(thronesdb, "Banefort", 5, 1)
insert_stronghold(thronesdb, "Castamere", 5, 1)
insert_stronghold(thronesdb, "Clegane's Keep", 5, 1)
insert_stronghold(thronesdb, "Cornfield", 5, 1)
insert_stronghold(thronesdb, "Crakehall", 5, 1)
insert_stronghold(thronesdb, "The Crag", 1, 1)
insert_stronghold(thronesdb, "Deep Den", 5, 1)
insert_stronghold(thronesdb, "Golden Tooth", 5, 1)
insert_stronghold(thronesdb, "Faircastle", 5, 1)
insert_stronghold(thronesdb, "Feastfires", 5, 1)
insert_stronghold(thronesdb, "Hornvale", 5, 1)
insert_stronghold(thronesdb, "Silverhill", 5, 1)
insert_stronghold(thronesdb, "Sarsfield", 5, 1)
insert_stronghold(thronesdb, "Castle Stokeworth", 5, 1)
insert_stronghold(thronesdb, "Horn Hill", 5, 1)

insert_stronghold(thronesdb, "Blackcrown", 5, 3)
insert_stronghold(thronesdb, "Brightwater Keep", 5, 3)
insert_stronghold(thronesdb, "Cider Hall", 5, 3)
insert_stronghold(thronesdb, "Goldengrove", 5, 3)
insert_stronghold(thronesdb, "Grassy Vale", 5, 3)
insert_stronghold(thronesdb, "Honeyholt", 5, 3)
insert_stronghold(thronesdb, "Old Oak", 5, 3)
insert_stronghold(thronesdb, "Sun House", 5, 3)
insert_stronghold(thronesdb, "Uplands", 5, 3)

insert_stronghold(thronesdb, "Eastwath-by-the-Sea", 5, 4)
insert_stronghold(thronesdb, "The Shadow Tower", 5, 4)
insert_stronghold(thronesdb, "Queenscrown", 5, 4)

# ===========================

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
  targaryen = 0
  nights_watch = 0
  brotherhood = 0

  chars.each do |character|
    if character["allegiance_id"] == 1 && character["alive"]
      lannister += character["allegiance_value"]
    elsif character["allegiance_id"] == 2 && character["alive"]
      stark += character["allegiance_value"]
    elsif character["allegiance_id"] == 3 && character["alive"]
      targaryen += character["allegiance_value"]
    elsif character["allegiance_id"] == 4 && character["alive"]
      nights_watch += character["allegiance_value"]
    elsif character["allegiance_id"] == 5 && character["alive"]
      brotherhood += character["allegiance_value"]
    end
  end
  castles.each do |castle|
    if castle["house_affiliation_id"] == 1
      lannister += castle["stronghold_value"]
    elsif castle["house_affiliation_id"] == 2
      stark += castle["stronghold_value"]
    elsif castle["house_affiliation_id"] == 3
      targaryen += castle["stronghold_value"]
    elsif castle["house_affiliation_id"] == 4
      nights_watch += castle["stronghold_value"]
    end
  end

  db.execute("UPDATE houses SET house_value=#{lannister} WHERE name='House Lannister'")
  db.execute("UPDATE houses SET house_value=#{stark} WHERE name='House Stark'")
  db.execute("UPDATE houses SET house_value=#{targaryen} WHERE name='House Targaryen'")
end

2.times{puts()}

house_value_calc(thronesdb, characters, strongholds)

# Here we go.
characters = thronesdb.execute("SELECT * FROM characters")
strongholds = thronesdb.execute("SELECT * FROM strongholds")
houses = thronesdb.execute("SELECT * FROM houses")

characters = characters.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}
strongholds = strongholds.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}
houses = houses.each {|hash| hash.delete_if {|column, row| column.class == Fixnum}}


p characters
p strongholds



3.times{puts()}

p houses