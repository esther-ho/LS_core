class MinilangError < StandardError; end
class InvalidTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @program = program
  end

  def eval
    @register = 0
    @stack = []

    @program.split.each do |token|
      eval_token(token)
    rescue MinilangError => error
      puts error.message
      break
    end
  end

  private

  def eval_token(token)
    if token =~ /^-*\d+$/
      @register = token.to_i
    elsif TOKENS.include?(token)
      check_stack unless ['PUSH', 'PRINT'].include?(token)
      send(token.downcase)
    else
      raise MinilangError, "Invalid token: #{token}"
    end
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end

  def check_stack
    raise EmptyStackError, "Empty stack!" if @stack.empty?
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
