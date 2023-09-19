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

class Player
  def initialize
    set_name
    @move_history = []
    @score = 0
  end

  def move
    move_history.last
  end

  def update_score
    self.score += 1
  end

  def reset_score
    self.score = 0
  end

  private

  attr_accessor :name, :move_history, :score
end

class Computer < Player
  private

  def set_name
    self.name = self.class.to_s
  end

  def update_moves(move)
    move_history << move
  end
end

class Spongebob < Computer
  def choose
    move = Move.new(Move::VALUES.keys.sample)
    update_moves(move)
  end
end

class Patrick < Computer
  def choose
    move = Move.new('paper')
    update_moves(move)
  end
end

class Squidward < Computer
  def choose
    move = Move.new(['rock', 'paper'].sample)
    update_moves(move)
  end
end
