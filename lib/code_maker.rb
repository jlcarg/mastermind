class CodeMaker
  attr_reader :secret_code

  def initialize
    @secret_code = %w[Red Blue Green Yellow Purple Orange].sample(4)
  end
end
