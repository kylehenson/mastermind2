require_relative 'response'

class Mastermind

  # def instructions
  #   Response.new(:message => "I have generated a random sequence of (r)ed, (b)lue, (g)reen, and (y)ellow. Guess the correct colors in the correct order:", :status => :continue)
  # end

  def execute(input)
    secret = "BBGB"
    if input == "i" || input == "instructions"
      Response.new(:message => "I have generated (r)ed, (b)lue, (g)reen, and (y)ellow in a random sequence. Guess the correct colors in the correct order:", :status => :continue)
    elsif input == "q" || input == "quit"
      Response.new(:message => "Thanks for playing!", :status => :stop)
    elsif input == secret.downcase
      Response.new(:message => "You Win!", :status => :won)
    else
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end

end
