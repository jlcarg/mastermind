require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

class Game
  def initialize(choice)
    @code_maker = CodeMaker.new(choice)
    @code_breaker = CodeBreaker.new('player1')
    @board = Board.new(@code_maker)
  end

  def start
    until @board.correct_guess? || @code_breaker.number_of_guesses > 12

      @code_breaker.make_a_guess(@board)
      p 'last guesses are:'
      p @code_breaker.previous_guesses
      @board.give_feedback
    end
    p @board.secret_code
  end
end
