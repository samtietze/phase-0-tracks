# Iron Throne Predictor

# First, we need to get SQLite into the program, and make
# some commands for creating the database as well as the
# tables. Once these commands are written, inserting data
# can be performed.

require 'sqlite3'

thronesdb = SQLite3::Database.new("thronesdb.db")
# thronesdb.results_as_hash = true

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
p characters
p strongholds
p houses