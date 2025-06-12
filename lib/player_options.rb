class PlayerOptions
  attr_accessor :code_maker_option, :code_breaker_option

  def initialize
    @code_maker_option = '2'
    @code_breaker_option = '1'
    show_welcome_message
    prompt_change_options
    handle_menu
  end

  def show_welcome_message
    puts "Mastermind in the command line\nby jlcarg\n\n"
  end

  def prompt_change_options
    puts 'Would you like to play the standard version of the game or would you like to change the options?'
    puts 'Standard version: Computer generates random secret code and a Human player attempts to break the code'
  end

  def valid_option?(option)
    option.length == 1 && %w[1 2].include?(option)
  end

  def show_error_message
    puts 'That is not a valid input, please read the instructions again!'
  end

  def change_maker_option
    player_choice = '0'
    puts "\nWould you like yourself to make the secret code for another player or the computer to crack?\n"
    puts "Or would you prefer to ask the game to create a random secret code?\n"
    until valid_option?(player_choice)
      puts 'Type 1 to enter your own secret code, or 2 for a random one'
      player_choice = gets.chomp
      show_error_message unless valid_option?(player_choice)
    end
    @code_maker_option = player_choice
  end

  def change_breaker_option
    player_choice = '0'
    puts "\nShould a human or the computer try to break the code?"
    until valid_option?(player_choice)
      puts 'Please type 1 for Human, or 2 for Computer'
      player_choice = gets.chomp
      show_error_message unless valid_option?(player_choice)
    end
    @code_breaker_option = player_choice
  end

  def change_options
    change_maker_option
    change_breaker_option
  end

  def handle_menu
    player_choice = '0'
    until valid_option?(player_choice)
      puts 'Type 1 to change the options, or 2 to play the standard version'
      player_choice = gets.chomp
      show_error_message unless valid_option?(player_choice)
    end
    change_options unless player_choice == '2'
    puts "\nOkay! Your choice has been recorded"
  end
end
