class CodeBreaker
  attr_reader :name, :number_of_guesses

  def initialize(name)
    @name = name
    @number_of_guesses = 0
  end

  def make_a_guess(board)
    new_guess = [nil]
    until guess_is_valid?(new_guess)
      puts "\nPlease select a color using the correspondent number\n"\
      "1-Red, 2-Blue, 3-Green, 4-Yellow, 5-Purple, 6-Orange\n"\
      "Example: 1125 = Red, Red, Blue, Purple\n"
      new_guess = gets.chomp.split('')
      handle_guess(new_guess, board)
    end
  end

  def guess_is_valid?(guess)
    guess.length == 4 && guess.all? { |number| number.to_i.positive? && number.to_i < 6 }
  end

  def handle_guess(guess, board)
    if guess_is_valid?(guess)
      board.guess_list << guess
    else
      puts 'Input not acceptable, please read the instructions again!'
    end
  end
end
