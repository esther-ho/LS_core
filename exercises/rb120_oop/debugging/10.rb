# `AuthenticationError` should inherit from a subclass of `Exception` as the `Exception` class is too broad
# `StandardError` is the parent class of `ArgumentError`, which is appropriate for `AuthenticationError` to inherit from.
# All other descendants of `Exception` shouldn't be rescued and should be left handled by Ruby
class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  # Rescue `ZeroDivisionError` if there is no valid score.
  # Since the case statement in `Score::find_out` is comparing the output of `Score::for_term` to the Class `NoScore` using the `===` operator, it should return an instance of `NoScore` when the `ZeroDivisionError` is rescued.
  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)

      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  # Rescue only `StandardError` and not all `Exception`s
  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
