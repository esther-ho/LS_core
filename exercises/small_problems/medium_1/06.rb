=begin
--- P
Input: a string that represents a command
Output: print the integer value that represents the value in the register, if applicable - otherwise, no output

Explicit rules:
- All programs are valid
- The register should be initialized to 0
- Push and pop add and remove the most recent item
- The register is not part of the stack
- Operations that require two values (one from the stack and one from the register):
  - Pops the most recent value from the stack
  - Performs the operation
  - Stores the result in the register

Implicit rules:
- An integer that corresponds to the string value passed to `minilang` is used in the program
- An output is only printed when the `'PRINT'` command is given
- Commands are separated by whitespace
- The register has only one value
- The stack can have multiple values

--- E
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

--- D
- Input: a string
- In-between:
  - an array of commands given to minilang
  - an array of numbers in the stack
- Output: an integer, or nothing

--- A
- Execute commands from left to right
  - Split the string into its individual command names
  - If command is an number string, convert it to an integer
  - Call the related method that executes the command
    - number: place value in register
    - PUSH: push register value on to stack. Leave value in register.
    - ADD: pop value from stack and add to register. Store result in register.
    - SUB: pop value from stack and subtract from register. Store result in register.
    - MULT: pop value from stack and multiply by register. Store result in register.
    - DIV: pop value from stack and divide by register. Store result in register.
    - MOD: pop value from stack and divide by register. Store remainder in register.
    - POP: Remove last-added value from stack and place in register
    - PRINT: print register value
=end

def minilang(commands)
  register = 0
  stack = []

  commands.split.each do |command|
    if stack.empty? && command !~ /^(-*\d+|PRINT|PUSH)$/
      puts "Stack is empty!"
      break
    else
      case command
      when 'ADD'     then register += stack.pop
      when 'SUB'     then register -= stack.pop
      when 'MULT'    then register *= stack.pop
      when 'DIV'     then register /= stack.pop
      when 'MOD'     then register %= stack.pop
      when 'PUSH'    then stack << register
      when 'POP'     then register = stack.pop
      when 'PRINT'   then puts register
      when /^-*\d+$/ then register = command.to_i
      else
        puts "Invalid command!"
        break
      end
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further exploration
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')

minilang('3 PUSH TWO MOD PRINT')
# => Invalid command

minilang('3 PUSH 5 DIV MULT PRINT')
# => Empty stack
