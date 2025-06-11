require_relative 'input_helper'

class CodeBreaker
  include InputHelper
  attr_reader :name, :number_of_guesses, :previous_guesses, :breaker

  def initialize(choice)
    @breaker = choice
    @number_of_guesses = 0
    @previous_guesses = []
    @computer_memory = %w[0 0 0 0]
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

  def memory_slot_empty?(idx)
    @computer_memory[idx] == '0'
  end

  def take_computer_guess_with_memory(board)
    update_computer_memory(board)
    new_guess = []
    @computer_memory.each_with_index do |color, idx|
      new_guess[idx] = memory_slot_empty?(idx) ? %w[Red Blue Green Yellow Purple Orange].sample : color
    end
    board.guess_list << new_guess
    @previous_guesses << new_guess
    @number_of_guesses += 1
  end

  def update_computer_memory(board)
    board.guess_list.each do |guess|
      guess.each_with_index do |color, idx|
        @computer_memory[idx] = color if color == board.secret_code[idx]
      end
    end
  end

  def prompt_downloading_super_computer_memory
    puts 'Th1s w1Ll t4k3 t0o l0ng... D0wnl04d1ng suP3r M3m0ry'
    sleep 2
    puts 'Progress: [########-------------------------]'
    sleep 2
    puts 'Progress: [############################-----]'
    sleep 2
    puts 'Download completed.'
  end

  def take_computer_guess(board)
    if @number_of_guesses == 3
      prompt_downloading_super_computer_memory
      take_computer_guess_with_memory(board)
    elsif @number_of_guesses > 3
      puts "Mmmm... let's see... maybe I should guess this one"
      take_computer_guess_with_memory(board)
    else
      take_computer_random_guess(board)
    end
  end

  def take_a_guess(board)
    case @breaker
    when '1'
      take_human_guess(board)
    when '2'
      take_computer_guess(board)
    end
  end
end
