class Question
  attr_reader :numbers, :answer
  def initialize()
    @numbers = [rand(1..20), rand(1..20)]
    @answer = @numbers[0] + @numbers[1]
  end
  
  def ask_question(player)
    puts "#{player}: What does #{@numbers[0]} plus #{@numbers[1]} equal?"
  end

  def get_answer?
    answer = gets.chomp
    answer.to_i == @answer
  end
end
