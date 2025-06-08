require_relative 'input_helper'

class CodeMaker
  include InputHelper
  attr_accessor :secret_code
  attr_reader :maker

  def initialize(choice)
    @maker = choice
    @secret_code = [nil]
    # Fixed value to help with testing for now
    # @secret_code = %w[Red Red Blue Purple]
    case @maker
    when '1'
      input_human_secret_code
    when '2'
      generate_random_secret_code
    end
  end

  def generate_random_secret_code
    @secret_code = %w[Red Blue Green Yellow Purple Orange].sample(4)
    puts 'Secret code recorded!'
  end

  def input_human_secret_code
    secret_code = [nil]
    until choice_is_valid?(secret_code)
      prompt_for('secret code')
      secret_code = gets.chomp.split('')
      show_error_message unless choice_is_valid?(secret_code)
    end
    @secret_code = translate_code(secret_code)
    puts 'Alright, your secret code was recorded!'
  end
end
