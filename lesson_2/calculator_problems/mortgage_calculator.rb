require 'psych'

MESSAGES = Psych.load_file('config_mortgage.yml')
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
def combine(key, result_string)
  puts message(key) + result_string
end

# Check if the input is a valid whole number
def whole_number?(number)
  /^\d+$/.match(number)
end

# Check if the input is a valid integer or float (up to 2 decimal places)
# Input can include consistent commas (e.g. 0,000 format)
def decimal_number?(number)
  /^(\d+|\d{1,3}(,\d{3})*)(\.\d{,2})?$/.match(number)
end

# Ask user for a valid total loan amount
def valid_loan
  total_loan = ''

  loop do
    prompt('total_loan')
    prompt('loan_example')

    total_loan = gets.chomp.strip
    total_loan.sub!('$', '').strip! if total_loan.start_with?('$')
    break if decimal_number?(total_loan) && total_loan.to_f > 1
    prompt('valid_loan')
  end

  total_loan.gsub(',', '').to_f
end

# Ask user for a valid APR in percentage
def valid_apr
  apr = ''

  loop do
    prompt('apr')
    prompt('apr_example')

    apr = gets.chomp.strip
    apr.sub!('%', '').strip! if apr.end_with?('%')
    break if decimal_number?(apr) && apr.to_f.between?(0, 100)
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
def valid_duration(duration_type)
  duration = ''

  loop do
    duration_prompt(duration_type)
    duration = gets.chomp.strip

    case duration_type
    when 'month'
      break if whole_number?(duration) && duration.to_f.between?(1, 600)
      prompt('valid_month')
    else
      break if decimal_number?(duration) && duration.to_f.between?(1, 50)
      prompt('valid_year')
    end
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
  number_string = number.round(2).to_s
  if number_string.end_with?('.0')
    number_string.sub('.0', '')
  else
    format('%.2f', number_string)
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

loop do
  total_loan = valid_loan
  system 'clear'

  apr = valid_apr
  system 'clear'

  duration_type = month_or_year
  system 'clear'

  duration_in_months = valid_duration(duration_type)
  system 'clear'

  puts message('break')
  puts message('input_summary')

  combine('loan_input', '$ ' + format_number(total_loan))
  combine('apr_input', format_number(apr) + ' %')
  combine('duration_years', format_number(duration_in_months / 12))
  combine('duration_months', format_number(duration_in_months))

  puts message('break')
  prompt('calculate')

  sleep(1.5)

  monthly_interest = apr / 12
  monthly_payment =
    calculate_payment(total_loan, monthly_interest, duration_in_months)
  total_payment = monthly_payment * duration_in_months
  total_interest = total_payment - total_loan

  puts message('break')
  puts message('results')

  combine('monthly_payment', '$ ' + format_number(monthly_payment))
  combine('monthly_interest', format_number(monthly_interest) + ' %')

  puts

  combine('loan_input', '$ ' + format_number(total_loan))
  combine('total_interest', '$ ' + format_number(total_interest))
  combine('total_payment', '$ ' + format_number(total_payment))

  puts message('break')
  sleep(2)

  prompt('again')
  prompt('again_example')
  answer = again
  break if %w(n no).include?(answer)

  system 'clear'
end

prompt('bye')
