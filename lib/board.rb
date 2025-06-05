class Board
  def initialize(code_maker)
    @secret_code = code_maker.secret_code
    @guess_list = []
    @guess_count = 0
  end

  # private

  attr_reader :secret_code
end
