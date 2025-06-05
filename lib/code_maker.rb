class CodeMaker
  attr_reader :secret_code

  def initialize
    # Fixed value to help with testing for now
    @secret_code = %w[Red Red Blue Purple]
    # @secret_code = %w[Red Blue Green Yellow Purple Orange].sample(4)
  end
end
