require_relative 'lib/game'

option = '0'
puts "Hello, this is Mastermind in the command line\nby jlcarg\n\n"
puts "Would you like yourself to make a secret code for another player or the computer to crack?\n"
puts "Or would you prefer to ask the game to create a random secret code?\n"
puts 'Please type 1 for the option to create your own secret code or 2 for a random one'
until option.length == 1 && %w[1 2].include?(option)
  option = gets.chomp
  unless option.length == 1 && %w[1 2].include?(option)
    puts 'Invalid input, please type 1 for writing your own secret code or 2 for a random secret code'
  end
end
game = Game.new(option)
game.start
