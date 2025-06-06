class Board
  attr_accessor :guess_list, :secret_code

  def initialize(code_maker)
    @secret_code = code_maker.secret_code
    @guess_list = []
  end

  def correct_guess?
    puts 'You broke the secret code, congratulations!!' if @guess_list[-1] == @secret_code
  end

  def give_feedback
    exact_matches = check_num_exact_matches
    partial_matches = check_num_matches - exact_matches
    puts "Number of exact matches in your last guess: #{exact_matches}"
    puts "Number of color matches(correct color, but wrong position), in your last guess: #{partial_matches}"
  end

  def check_num_exact_matches
    exact_matches = 0
    @guess_list[-1].each_with_index do |color, index|
      exact_matches += 1 if color == @secret_code[index]
    end
    exact_matches
  end

  def check_num_matches
    num_matches = 0
    guess_tally = @guess_list[-1].tally
    secret_code_tally = @secret_code.tally
    guess_tally.each do |key, value|
      if secret_code_tally.key?(key)
        matches = value > secret_code_tally[key] ? secret_code_tally[key] : value
        num_matches += matches
      end
    end
    num_matches
  end

  # private

  attr_reader :secret_code
end
