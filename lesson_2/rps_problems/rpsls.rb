require 'psych'

MESSAGES = Psych.load_file('config_rpsls.yml')

def message(key)
  MESSAGES[key]
end

def prompt(key)
  puts "=> #{message(key)}"
end

system 'clear'
prompt('welcome')
