# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yell_happily(words)
#     words + "!!!" + " :D"
#   end
# end

# p Shout.yell_angrily("Son of a gun")
# p Shout.yell_happily("Son of a gun")

# p Shout.yell_angrily("Damn dog")
# p Shout.yell_happily("Good dog")

module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + "!!!" + " :D"
  end
end

class Dads
  include Shout
end

class Brothers
  include Shout
end

dad = Dads.new
p dad.yell_angrily("Damn dog")
p dad.yell_happily("Good dog")

brother = Brothers.new
p brother.yell_angrily("Son of a gun")
p brother.yell_happily("Son of a gun")