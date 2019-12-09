require_relative 'player'
require_relative 'question'

# Tracks the current turn, and handles the generation
# of questions, display of questions, and result of
# player input for answers
class Game
  attr_reader :turn

  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @turn = 0
    play_game
  end

  def play_game
    @playing = true
    while @playing
      if play_turn
        @playing = false
      end
    end
    p '----- GAME OVER -----'
    p 'Good bye!'
  end

  def play_turn
    @question = Question.new
    p "----- NEW TURN -----"
    p "#{@players[@turn].name}: #{@question.question}"
    @answer = gets.chomp
    @result = @question.answer(@answer)
    if (@result)
      p "#{@players[@turn].name}: YES! You are correct."
    else
      p "#{@players[@turn].name}: Seriously? No!"
      @players[@turn].reduce_lives
    end
    if @players[@turn].lives <= 0
      next_turn
      p "#{@players[@turn].name} wins with a score of #{@players[@turn].lives}/3"
      return true
    end
    next_turn
    return false
  end

  def next_turn
    if @turn === 0
      @turn = 1
    else 
      @turn = 0
    end
  end
end

g = Game.new