class CodeMaker
  attr_reader :secret_code, :maker

  def initialize
    @maker = nil
    # @secret_code = nil
    # Fixed value to help with testing for now
    @secret_code = %w[Red Red Blue Purple]
    # @secret_code = %w[Red Blue Green Yellow Purple Orange].sample(4)
  end

  # def make_code
  #   case @maker
  #   when 'Player'
  #     puts 'Please select a code'
  #   end
  # end
  def get_code_by_human
    puts "Please select a secret code of 4 colors\nYou can repeat colors!\n"\
         "Select the colors using the corresponding number:\n"\
         "1-Red, 2-Blue, 3-Green, 4-Yellow, 5-Purple, 6-Orange\n"\
         "Example: 1125 = Red, Red, Blue, Purple\n"
    @secret_code = gets.chomp.split('')
  end
end
