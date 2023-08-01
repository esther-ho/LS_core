# Return one UUID when called with no parameters

require  'random/formatter'

def build_uuid
  uuid = [8, 4, 4, 4, 12]
  uuid.map! do |size|
    Random.hex[0, size]
  end

  uuid.join('-')
end
