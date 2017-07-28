# Iron Throne Predictor

# First, we need to get SQLite into the program, and make
# some commands for creating the database as well as the
# tables. Once these commands are written, inserting data
# can be performed.

require 'sqlite3'

thronesdb = SQLite3::Database.new("thronesdb.db")

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
    stronghold_id INT,
    leader_id INT,
    house_value INT,
    FOREIGN KEY (stronghold_id) REFERENCES strongholds(id),
    FOREIGN KEY (leader_id) REFERENCES characters(id)
  )
SQL

create_strongholds_table = <<-SQL
  CREATE TABLE IF NOT EXISTS strongholds(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    stronghold_value INT
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

def insert_character(db, name, debut, value, allegiance, alive)
  db.execute("INSERT OR IGNORE INTO characters (name, first_seen, allegiance_value, allegiance_id, alive) VALUES (?, ?, ?, ?, ?)", [name, debut, value, allegiance, alive])
end

insert_character(thronesdb, "Stannis Baratheon", "Season 2", 0, 1, "false")


characters = thronesdb.execute("SELECT * FROM characters")
p characters