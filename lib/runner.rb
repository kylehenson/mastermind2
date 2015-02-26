require './lib/mastermind'
require './lib/messages'

class Runner
  def run
    messages = Messages.new
    messages.welcome

    mastermind = Mastermind.new
    response = nil

    until response && response.status == :stop
      print "> "
      input = gets.chomp.downcase
      response = mastermind.execute(input)
      puts response.message
    end
    messages.goodbye
  end
end
