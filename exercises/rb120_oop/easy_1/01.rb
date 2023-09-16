class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * message.size}-+"
  end

  def empty_line
    "| #{' ' * message.size} |"
  end

  def message_line
    "| #{message} |"
  end

  attr_reader :message
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further exploration

class Banner
  MAX_WIDTH = 1000

  def initialize(message, width = message.size + 2)
    @message = message
    @width = set_width(width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * width}+"
  end

  def empty_line
    "|#{' ' * width}|"
  end

  def message_line
    "|#{message.center(width)}|"
  end

  def invalid_width?(value)
    !value.nil? && (value < message.size || value > MAX_WIDTH)
  end

  def invalid_width
    "The width provided is too small/large. Please provide a valid width."
  end

  def set_width(width)
    if width.nil?
      message.size + 2
    elsif invalid_width?(width)
      puts invalid_width
      message.size + 2
    else
      width + 2
    end
  end

  attr_reader :message, :width
end

banner = Banner.new('', 10)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 20)
puts banner
