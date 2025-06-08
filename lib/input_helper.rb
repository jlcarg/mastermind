module InputHelper
  def prompt_for(option)
    puts "Please make a #{option} of 4 colors\nYou can repeat colors!\n"\
         "Select the colors using the corresponding number:\n"\
         "1-Red, 2-Blue, 3-Green, 4-Yellow, 5-Purple, 6-Orange\n"\
         "Example: 1125 = Red, Red, Blue, Purple\n"
  end

  def show_error_message
    puts 'Input not acceptable, please read the instructions again!'
  end

  def choice_is_valid?(code)
    code.length == 4 && code.all? { |number| number.to_i.positive? && number.to_i <= 6 }
  end

  def translate_code(code)
    color_hash = { '1' => 'Red', '2' => 'Blue', '3' => 'Green', '4' => 'Yellow', '5' => 'Purple', '6' => 'Orange' }
    translated_code = []
    code.each_with_index do |number, idx|
      translated_code[idx] = color_hash[number]
    end
    translated_code
  end
end
