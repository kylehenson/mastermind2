class Messages

  def welcome
    puts "Welcome to Mastermind"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit"
  end

  def instructions
    "I will generate a random sequence of (r)ed, (b)lue, (g)reen, and (y)ellow in any order.
    Guess the correct colors in the correct order in as few attempts possible:"
  end

  def play
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.
    Use (q)uit at any time to end the game. What's your guess?"
  end

  def cheat
    "The secret sequence is:"
  end

  def quit
    "Thanks for playing!"
  end

  def goodbye
    puts "Goodbye!"
  end

end
