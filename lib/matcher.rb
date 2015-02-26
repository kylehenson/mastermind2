class Matcher
  attr_reader :secret,
              :guess

  def initialize(secret, guess)
    @secret = secret.chars
    @guess = guess.chars
  end


  def full_match?
    # require 'pry'; binding.pry
    @secret == @guess
  end

  def correct_positions
    counter = 0
    secret.each_with_index do |color, i|
      counter += 1 if color == guess[i]  
    end
    counter
  end


end
