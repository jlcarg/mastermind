require_relative 'input_helper'

class CodeMaker
  include InputHelper
  attr_accessor :secret_code
  attr_reader :maker

  def initialize(choice)
    @maker = choice
    @secret_code = [nil]
    case @maker
    when '1'
      input_human_secret_code
    when '2'
      generate_random_secret_code
    end
  end

  def generate_random_secret_code
    @secret_code = translate_code(Array.new(4) { %w[1 2 3 4 5 6].sample })
  end

  def input_human_secret_code
    secret_code = [nil]
    until choice_is_valid?(secret_code)
      prompt_for('secret code')
      secret_code = gets.chomp.split('')
      show_error_message unless choice_is_valid?(secret_code)
    end
    @secret_code = translate_code(secret_code)
  end
end
