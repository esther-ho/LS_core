require 'psych'

CONFIG = Psych.load_file('config_rpsls.yml')

class Move
  VALUES = CONFIG['choices']

  def initialize(value)
    @value = value
  end

  def >(other_move)
    VALUES[value]['beats'].include?(other_move.value)
  end

  protected
  
  attr_reader :value
end
