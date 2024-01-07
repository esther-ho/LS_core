class Minilang
  COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(commands)
    @commands = commands.split
    @register = 0
    @stack = []
  end

  def eval
    @commands.each do |command|
      raise StandardError, "Invalid token: #{command}" unless valid_token?(command)

      if command =~ /^-*\d+$/
        @register = command.to_i
      else
        send(command.downcase)
      end
    end
  end

  private

  def push()
    @stack.push(@register)
  end

  def add
    @register += @stack.pop unless empty_stack
  end

  def sub
    @register -= @stack.pop unless empty_stack
  end

  def mult
    @register *= @stack.pop unless empty_stack
  end

  def div
    @register /= @stack.pop unless empty_stack
  end

  def mod
    @register %= @stack.pop unless empty_stack
  end

  def pop
    @register = @stack.pop unless empty_stack
  end

  def print
    puts @register
  end

  def empty_stack
    raise StandardError, "Empty stack!" if @stack.empty?
  end

  def valid_token?(command)
    command =~ /^-*\d+$/ || COMMANDS.include?(command)
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

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
