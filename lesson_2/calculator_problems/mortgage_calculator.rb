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
def prompt(key)
  puts "=> #{message(key)}"
end

# Combine prompt and result
def result(key, optional_string='')
  puts message(key) + optional_string
end

# Check if the input is a valid number
def number?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

# Ask user for a valid total loan amount
def valid_loan
  total_loan = ''

  loop do
    prompt('total_loan')
    prompt('loan_example')
    total_loan = gets.chomp.strip
    total_loan =
      total_loan.chars.delete_if do |char|
        ['$', ',', ' ', '_'].include?(char)
      end.join
    break if number?(total_loan) && total_loan.to_f > 1
    prompt('valid_loan')
  end

  total_loan.to_f
end

# Ask user for a valid APR in percentage
def valid_apr
  apr = ''

  loop do
    prompt('apr')
    prompt('apr_example')
    apr = gets.chomp.strip
    apr = apr.delete('%')
    break if number?(apr) && apr.to_f.between?(0, 100)
    prompt('valid_apr')
  end

  apr.to_f
end

# Ask if duration is in months or years
def month_or_year
  duration_type = ''
  month = %w(1 m month months)
  year = %w(2 y year years)
  loop do
    prompt('month_or_year')
    duration_type = gets.chomp.strip
    break if (month + year).include?(duration_type)
    prompt('valid_duration')
  end

  month.include?(duration_type) ? 'month' : 'year'
end

# Print appropriate duration prompt
def duration_prompt(duration_type)
  case duration_type
  when 'month'
    prompt('month')
    prompt('month_example')
  else
    prompt('year')
    prompt('year_example')
  end
end

# Ask user for valid duration
def valid_duration
  duration = ''
  duration_type = month_or_year

  loop do
    duration_prompt(duration_type)
    duration = gets.chomp.strip
    break if number?(duration) && duration.to_f.between?(1, 600)
    prompt('valid_duration')
  end

  duration_type == 'month' ? duration.to_f : duration.to_f * 12
end

# Calculate monthly payment
def calculate_payment(total_loan, monthly_interest, months)
  monthly_interest /= 100
  denominator = 1 - (1 + monthly_interest)**(-months)
  total_loan * (monthly_interest / denominator)
end

# Simplify float to an integer if ending with '.0'
def simplify_number(number)
  number_string = number.ceil(2).to_s
  if number_string.end_with?('.0')
    number_string.sub('.0', '')
  else
    number_string
  end
end

# Format numbers to include commas for every 3 digits
def format_number(number)
  number_string = simplify_number(number)
  integer, decimal = number_string.split('.')
  integer_groups = integer.chars.reverse.each_slice(3).map(&:join)
  integer_with_commas = integer_groups.join(',').reverse
  [integer_with_commas, decimal].compact.join('.')
end

# Ensure user enters 'Y'/'Yes' or 'N'/'No'
def again
  answer = ''

  loop do
    answer = gets.chomp.downcase
    break if %w(y yes n no).include?(answer)
    prompt('valid_again')
  end

  answer
end

# Main mortgage calculator program
system 'clear'

prompt('welcome')
result('break')

loop do
  total_loan = valid_loan
  apr = valid_apr
  duration_in_months = valid_duration

  prompt('calculate')

  monthly_interest = apr / 12
  monthly_payment =
    calculate_payment(total_loan, monthly_interest, duration_in_months)
  total_payment = monthly_payment * duration_in_months

  result('break')
  result('results')

  result('monthly_payment', '$ ' + format_number(monthly_payment))
  result('monthly_interest', format_number(monthly_interest) + ' %')
  result('duration', format_number(duration_in_months) + ' months')

  puts

  result('total_payment', '$ ' + format_number(total_payment))
  result('total_interest', '$ ' + format_number(total_payment - total_loan))

  result('break')

  prompt('again')
  prompt('again_example')
  answer = again
  break if %w(n no).include?(answer)
end

prompt('bye')
