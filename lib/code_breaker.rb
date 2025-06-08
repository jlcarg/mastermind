require_relative 'input_helper'

class CodeBreaker
  include InputHelper
  attr_reader :name, :number_of_guesses, :previous_guesses, :breaker

  def initialize(choice)
    @breaker = choice
    @number_of_guesses = 0
    @previous_guesses = []
  end

  def handle_guess(guess, board)
    if choice_is_valid?(guess)
      guess_in_colors = translate_code(guess)

      board.guess_list << guess_in_colors
      @previous_guesses << guess_in_colors
      @number_of_guesses += 1
    else
      puts 'Input not acceptable, please read the instructions again!'
    end
  end

  def take_human_guess(board)
    new_guess = [nil]
    until choice_is_valid?(new_guess)
      prompt_for('guess')
      new_guess = gets.chomp.split('')
      handle_guess(new_guess, board)
    end
  end

  def take_computer_random_guess(board)
    puts 'M4ch1n3 th1nk1ng...'
    sleep 5
    random_guess = Array.new(4) { %w[1 2 3 4 5 6].sample }
    handle_guess(random_guess, board)
  end

  def take_a_guess(board)
    case @breaker
    when '1'
      take_human_guess(board)
    when '2'
      take_computer_random_guess(board)
    end
  end
end
