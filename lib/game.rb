require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

code_maker = CodeMaker.new
code_breaker = CodeBreaker.new('player1')
board = Board.new(code_maker)

p 'secret code is:'
p board.secret_code
code_breaker.make_a_guess(board)
p 'last guesses are:'
p code_breaker.previous_guesses
board.give_feedback
