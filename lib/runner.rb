require './lib/mastermind'

class Runner
  def run
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit"

    mastermind = Mastermind.new
    response = nil

    until response && response.status == :stop
      print "> "
      input = gets.chomp.downcase
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
end
