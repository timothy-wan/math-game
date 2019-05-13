class Player 
  attr_accessor :name, :lives
  def initialize(name, startinglives)
    @name = name
    @lives = startinglives
  end
end