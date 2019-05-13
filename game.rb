MAX_LIFE = 3
class Game
  def initialize
    @players = [Player.new('Player1', MAX_LIFE), Player.new('Player2', MAX_LIFE)]
  end

  def evaluate_response(player)
    question = Question.new
    question.ask_question player.name
    unless question.get_answer?
      puts "#{player.name}: Seriously? No!"
      player.lives = player.lives - 1
    else
      puts "#{player.name}: YES! You are correct!"
    end      
  end

  def new_turn
    player1 = @players[0]
    player2 = @players[1]
    @players.each { |player|
      puts "----- NEW TURN -----"
      evaluate_response player
      puts "P1: #{player1.lives}/#{MAX_LIFE} vs P2: #{player2.lives}/#{MAX_LIFE}"
    }
  end

  def end_of_game
    player1 = @players[0]
    player2 = @players[1]
    if player1.lives == 0 && player2.lives == 0
      puts "Tie game!"
      puts "----- GAME OVER -----"
      puts "Good bye"
    elsif player1.lives == 0
      puts "#{player2.name} wins with a score of #{player2.lives}/#{MAX_LIFE}"
      puts "----- GAME OVER -----"
      puts "Good bye"
    elsif player2.lives == 0
      puts "#{player1.name} wins with a score of #{player1.lives}/#{MAX_LIFE}"
      puts "----- GAME OVER -----"
      puts "Good bye"
    end
  end
  
  def play
    until @players[0].lives == 0 || @players[1].lives == 0
      new_turn
    end
    end_of_game
  end

end