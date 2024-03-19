=begin
--- P
Rules:
- Robot has a random name generated when first created e.g. RX937 or BC811
- Resetting robot wipes their name
- When asked again, robot responds with new random name
- Name should not follow a predictable sequence
- Same name should not be used twice
Class needs:
- #initialize DOES NOT generate name
- #name generates new random name and add name to existing collection
- #reset resets name to `nil` and removes name from existing collection
--- E
--- D
--- A
- Initialize class variable with an empty array `names`
- In #name
  - Return name if name is not nil
  - Generate new name
  - If new name exists in `names` array or is nil, keep generating a new name
  - Add new name to `names`
  - Return name
- In #reset
  - Remove name from collection
  - Assign name to nil
=end

class Robot
  @@names = []

  def name
    return @name if @name
    generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name.clone
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    @name = ('AA'..'ZZ').to_a.sample + ('001'..'999').to_a.sample
  end
end
