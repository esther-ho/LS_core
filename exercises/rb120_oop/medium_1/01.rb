class Machine
  # private methods can be called with `self` as of Ruby 2.7, but are not necessary
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
