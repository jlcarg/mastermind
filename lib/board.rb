require 'colorize'

class Board
  attr_accessor :guess_list, :secret_code

  def initialize(code_maker)
    @secret_code = code_maker.secret_code
    @guess_list = []
  end

  def correct_guess?
    @guess_list[-1] == @secret_code
  end

  def give_feedback
    update_display
    return unless correct_guess?

    puts "\nCongratulations! You cracked the secret code in #{@guess_list.length}!" \
          "\nThe secret code was: #{@guess_list[-1]}"
  end

  def check_num_exact_matches(guess)
    exact_matches = 0
    guess.each_with_index do |color, index|
      exact_matches += 1 if color == @secret_code[index]
    end
    exact_matches
  end

  def check_num_matches(guess)
    num_matches = 0
    guess_tally = guess.tally
    secret_code_tally = @secret_code.tally
    guess_tally.each do |key, value|
      if secret_code_tally.key?(key)
        matches = value > secret_code_tally[key] ? secret_code_tally[key] : value
        num_matches += matches
      end
    end
    num_matches
  end

  def update_display
    puts "\n--------------------------------------------------"
    @guess_list.each_with_index do |guess, index|
      black_pins = '■'.colorize(:black) * check_num_exact_matches(guess)
      white_pins = '■'.colorize(:white) * (check_num_matches(guess) - check_num_exact_matches(guess))
      puts "Guess number: #{index + 1}: #{colorize_guess(guess)} - #{black_pins}#{white_pins}"
      puts '--------------------------------------------------'
    end
  end

  def transform_string_to_color_block(string)
    color_and_block_hash = { 'Red' => '■'.colorize(:red), 'Blue' => '■'.colorize(:blue),
                             'Green' => '■'.colorize(:green), 'Yellow' => '■'.colorize(:yellow),
                             'Magenta' => '■'.colorize(:magenta), 'Cyan' => '■'.colorize(:cyan) }
    color_and_block_hash[string]
  end

  def colorize_guess(array)
    guess_in_color_blocks = ''
    array.each do |color|
      guess_in_color_blocks << transform_string_to_color_block(color)
    end
    guess_in_color_blocks
  end
end
