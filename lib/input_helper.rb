module InputHelper
  def prompt_for(option)
    puts "\nPlease make a #{option} of 4 colors\nYou can repeat colors!\n"\
         "Select the colors using the corresponding number:\n"\
         "1-Red, 2-Blue, 3-Green, 4-Yellow, 5-Magenta, 6-Cyan\n"\
         "Example: 1125 = Red, Red, Blue, Magenta\n"
  end

  def show_error_message
    puts 'Input not acceptable, please read the instructions again!'
  end

  def choice_is_valid?(code)
    code.length == 4 && code.all? { |number| number.to_i.positive? && number.to_i <= 6 }
  end

  def translate_code(code)
    color_hash = { '1' => 'Red', '2' => 'Blue', '3' => 'Green', '4' => 'Yellow', '5' => 'Magenta', '6' => 'Cyan' }
    translated_code = []
    code.each_with_index do |number, idx|
      translated_code[idx] = color_hash[number] if color_hash.key?(number)
    end
    translated_code
  end

  def transform_to_number(code)
    number_hash = { 'Red' => '1', 'Blue' => '2', 'Green' => '3', 'Yellow' => '4', 'Magenta' => '5', 'Cyan' => '6' }
    untranslated_code = []
    code.each_with_index do |color, idx|
      untranslated_code[idx] = number_hash[color] if number_hash.key?(color)
    end
  end
end
