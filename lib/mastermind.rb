require_relative 'messages'
require_relative 'response'
require 'pry'

class Mastermind
  attr_accessor :number_of_guesses

  def initialize
    @number_of_guesses = 1
  end

  # def instructions
  #   Response.new(:message => messages.instructions, :status => :continue)
  # end

  def execute(input)
    messages = Messages.new
    secret = "BBGB"
    if input == "i" || input == "instructions"
      Response.new(:message => messages.instructions, :status => :continue)
    elsif input == "p" || input == "play"
      Response.new(:message => messages.play, :status => :continue)
      # play
    elsif input == "q" || input == "quit"
      Response.new(:message => messages.quit, :status => :stop)
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
