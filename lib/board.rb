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

  # def give_feedback
  #   if correct_guess?
  #     puts "Congratulations! You cracked the secret code!\nThe secret code was: #{@guess_list[-1]}"
  #   else
  #     exact_matches = check_num_exact_matches
  #     # Subtract the number of exact matches to avoid counting it twice
  #     partial_matches = check_num_matches - exact_matches
  #     puts "Number of exact matches in your last guess: #{exact_matches}"
  #     puts "Number of color matches(correct color, but wrong position), in your last guess: #{partial_matches}"
  #   end
  # end
  def give_feedback
    update_display
    puts "Congratulations! You cracked the secret code!\nThe secret code was: #{@guess_list[-1]}" if correct_guess?
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
    @guess_list.each_with_index do |guess, index|
      black_pins = '■'.colorize(:black) * check_num_exact_matches(guess)
      white_pins = '■'.colorize(:white) * (check_num_matches(guess) - check_num_exact_matches(guess))
      guess_in_color_blocks = ''
      guess.each do |color|
        guess_in_color_blocks << transform_string_to_color_block(color)
      end
      puts "Guess number: #{index}: #{guess_in_color_blocks} - #{black_pins}#{white_pins}"
      puts '--------------------------------------------------'
    end
  end

  def transform_string_to_color_block(string)
    case string
    when 'Red'
      '■'.colorize(:red)
    when 'Blue'
      '■'.colorize(:blue)
    when 'Green'
      '■'.colorize(:green)
    when 'Yellow'
      '■'.colorize(:yellow)
    when 'Purple'
      '■'.colorize(:magenta)
    when 'Orange'
      '■'.colorize(:cyan)
    end
  end
end
