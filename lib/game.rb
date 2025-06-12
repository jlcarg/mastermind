require_relative 'code_maker'
require_relative 'code_breaker'
require_relative 'board'
require_relative 'player_options'

class Game
  def initialize
    @player_options = PlayerOptions.new
    @code_maker = CodeMaker.new(@player_options.code_maker_option)
    @code_breaker = CodeBreaker.new(@player_options.code_breaker_option)
    @board = Board.new(@code_maker)
    puts 'Secret Code recorded'
    puts 'Game will start in 3 seconds'
  end

  def reset_display
    system('clear')
    @player_options.show_welcome_message
    @board.update_display
  end

  def show_game_over_message
    reset_display
    puts "\nGAME OVER!\nSecret code was: #{@board.colorize_guess(@board.secret_code)}\n#{@board.secret_code}"
  end

  def show_victory_message
    reset_display
    puts "\nCongratulations! You broke the secret code in #{@code_breaker.number_of_guesses} " \
         "#{@code_breaker.number_of_guesses > 1 ? 'guesses' : 'guess'}!" \
         "\nSecret code was: #{@board.colorize_guess(@board.secret_code)}\n#{@board.secret_code}"
  end

  def start
    sleep 3
    until @board.correct_guess? || @code_breaker.number_of_guesses >= 12
      reset_display
      @code_breaker.take_a_guess(@board)
    end
    if @board.correct_guess?
      show_victory_message
    else
      show_game_over_message
    end
  end
end
