# Tracks player lives in an object the game can target
class Player
  attr_reader :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end

  def reduce_lives
    @lives -= 1
  end
end