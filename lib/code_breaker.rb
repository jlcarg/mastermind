require_relative 'input_helper'

class CodeBreaker
  include InputHelper
  attr_reader :name, :number_of_guesses, :previous_guesses

  def initialize(name)
    @name = name
    @number_of_guesses = 0
    @previous_guesses = []
  end

  def make_a_guess(board)
    new_guess = [nil]
    until choice_is_valid?(new_guess)
      prompt_for('guess')
      new_guess = gets.chomp.split('')
      handle_guess(new_guess, board)
    end
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
end
