require_relative 'response'
require 'pry'

class Mastermind
  attr_accessor :number_of_guesses

  def initialize
    @number_of_guesses = 1
  end

  def instructions
    Response.new(:message => "I will generate a random sequence of (r)ed, (b)lue, (g)reen, and (y)ellow in any order. Guess the correct colors in the correct order in as few attempts possible:", :status => :continue)
  end

  def execute(input)
    secret = "BBGB"
    if input == "i" || input == "instructions"
      instructions
    elsif input == "p" || input == "play"
      Response.new(:message => "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?", :status => :continue)
      # play
    elsif input == "q" || input == "quit"
      Response.new(:message => "Thanks for playing!", :status => :stop)
    elsif input == "c" || input == "cheat"
      Response.new(:message => "The secret sequence is: #{secret}", :status => :continue)
    elsif input.length < 4
      Response.new(:message => "Are you paying attention?? You need to guess four colors. If you need instructions, enter 'i'.", :status => :continue)
    elsif input.length > 4
      Response.new(:message => "You are making this too complicated. Guess four colors only. If you need instructions, enter 'i'.", :status => :continue)
    elsif input == secret.downcase
      Response.new(:message => "Congratulations! You guessed the sequence '#{secret}' in #{@number_of_guesses} guess(es) in just #{Time.new}.\nWould you like to (p)lay again or (q)uit?", :status => :won)
    else
      @number_of_guesses += 1
      Response.new(:message => "Guess again!", :status => :continue)
    end
  end

end
