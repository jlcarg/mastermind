require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'

code_maker = CodeMaker.new
code_breaker = CodeBreaker.new('player1')
board = Board.new(code_maker)

p board.secret_code
code_breaker.make_a_guess(board)
