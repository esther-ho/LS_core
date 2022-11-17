=begin
--- P
Inputs:
- Loan amount e.g. how much is being borrowed
- Annual percentage rate, the percent of interest paid yearly based on the loan amount
- Duration of loan
  - Allow user to choose to enter duration in years or months

Outputs:
- Interest rate per month
- Duration of the loan in months (e.g. how many total payments)
- Total amount to be paid per month

Implicit rules:
- APR will be given in % e.g. 5%
- Calculator is for a fixed rate mortgage
- No upfront payments
- Tax is not included in the payments
- Decimal points are denoted by '.' instead of ','

--- E

--- D

--- A
- Ask user for their name
  - Check if name is valid
- Ask user for their total loan amount
  - Check if loan amount is valid
- Ask user for their APY in % (e.g. 5%)
  - Check if APY is valid
- Ask user if they would like to input duration in years or months
  - Check if reply is valid
  - Check if duration is valid
- Calculate interest rate per month
  - Round to nearest two decimal places
- Calculate duration of loan in months (total payments)
  - Round to nearest integer
- Calculate total amount to be paid per month
  - Round to nearest two decimal places
- Return all calculations to the user
- Ask user if they would like to make changes or restart
  - Check if answer is valid
=end

require 'psych'

MESSAGES = Psych.load_file('mortgage_config.yml')
LANGUAGE = 'en'

# Retrieve the appropriate prompt based on the language
def message(key, lang=LANGUAGE)
  MESSAGES[lang][key]
end

# Add '=>' to all prompts
def prompt(message)
  puts "=> #{message}"
end

# Ask user for a valid name
def valid_name
  name = ''

  loop do
    name = gets.chomp.strip
    break if /\d|^$/ !~ name
    prompt(message('valid_name'))
  end

  name.capitalize
end

# Check if the input is a valid number
def number?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

# Ask user for a valid total loan amount
def valid_loan
  total_loan = ''

  loop do
    total_loan = gets.chomp.strip
    total_loan = total_loan.chars.delete_if { |char| ['$', ',', ' '].include?(char) }.join
    break if number?(total_loan) && total_loan.to_f > 1
    prompt(message('valid_loan'))
  end

  total_loan
end

# Ask user for a valid APR
def valid_apr
  apr = ''

  loop do
    apr = gets.chomp.strip
    break if number?(apr) && apr.to_f.between?(0,100)
    prompt(message('valid_apr'))
  end

  apr.to_f
end

# Main mortgage calculator program
system 'clear'

prompt(message('welcome'))
name = valid_name
prompt(message('greeting') + name + '!')

prompt(message('total_loan'))
total_loan = valid_loan

prompt(message('apr'))
apr = valid_apr
