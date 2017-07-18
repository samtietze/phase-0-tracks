# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'
# The program needs another file within the same folder in order to perform the methods below. Require is used for libraries, whereas require_relative is for an individual file.

class VirusPredictor

# Creating a new instance of VirusPreditor with three attributes
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# Runs both of the private methods listed below
        # RELEASE 5
        # Remove state as an input variable on three methods
  def virus_effects
    predicted_deaths
    speed_of_spread
    print "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n"
  end

  private

# Write a method that

# Based on population density, it calculates how many people will die, and rounds down to an integer, and then prints result
  def predicted_deaths

    # predicted deaths is solely based on population density

    # Write a method that takes population_density and based on that number, provides a different output for each grade

    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

  end

# Based on population density, speed variable is manipulated, and a result is printed
def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

# RELEASE 4
# Iterate over each key of the hash, creating a new instance of VirusPredictor

STATE_DATA.each { |key, value|
  state = VirusPredictor.new(key, STATE_DATA[key][:population_density], STATE_DATA[key][:population])
  state.virus_effects
}


#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# What does require_relative do? How is it different from require?
# What are some ways to iterate through a hash?
# When refactoring virus_effects, what stood out to you about the variables, if anything?
# What concept did you most solidify in this challenge?