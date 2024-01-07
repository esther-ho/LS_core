class Machine
  # private methods can be called with `self` as of Ruby 2.7, but are not necessary
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  # add method to display current state
  def display_state
    puts "Machine is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
machine.display_state
