=begin
--- P
Inputs:
- Loan amount e.g. how much is being borrowed
- Annual percentage rate, percent of interest paid yearly based on total loan
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
    prompt(message('total_loan'))
    total_loan = gets.chomp.strip
    total_loan =
      total_loan.chars.delete_if do |char|
        ['$', ',', ' ', '_'].include?(char)
      end.join
    break if number?(total_loan) && total_loan.to_f > 1
    prompt(message('valid_loan'))
  end

  total_loan.to_f
end

# Ask user for a valid APR
def valid_apr
  apr = ''

  loop do
    prompt(message('apr'))
    apr = gets.chomp.strip
    apr = apr.delete('%')
    break if number?(apr) && apr.to_f.between?(0, 100)
    prompt(message('valid_apr'))
  end

  apr.to_f
end

# Ask if duration is in months or years
def month_or_year
  duration_type = ''
  loop do
    prompt(message('month_or_year'))
    duration_type = gets.chomp.strip
    break if %w(m month months y year years).include?(duration_type)
    prompt(message('valid_duration'))
  end

  %w(m month months).include?(duration_type) ? 'month' : 'year'
end

# Ask user for valid duration
def valid_duration
  duration = ''
  duration_type = month_or_year

  loop do
    case duration_type
    when 'month'
      prompt(message('duration_month'))
    else
      prompt(message('duration_year'))
    end

    duration = gets.chomp.strip
    break if number?(duration) && duration.to_f.between?(1, 600)
    prompt(message('valid_duration'))
  end

  duration_type == 'month' ? duration.to_f : duration.to_f * 12
end

# Main mortgage calculator program
system 'clear'

prompt(message('welcome'))
name = valid_name
prompt(message('greeting') + name + '!')

total_loan = valid_loan
apr = valid_apr
duration_in_months = valid_duration
