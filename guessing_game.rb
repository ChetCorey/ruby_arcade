require 'active_support/inflector'

class GuessingGame
  attr_accessor :wallet, :player

  def initialize
    @count = 0
    @computer_guess = rand(1..100)
    @wallet = wallet
    @player = []
  end

  def play
    intro
    turn
  end

  def turn
    # puts @computer_guess
    print "Your guess : "
    human_guess = gets.chomp
    hint if human_guess.to_s.downcase == "hint"
    puts human_guess = human_guess.to_i
    outcome(human_guess, @computer_guess)
    guesses_remaining
  end

  def hint
    puts "The number is between " + (@computer_guess - rand(1..10)).to_s + " and " + (@computer_guess + rand(1..10)).to_s
    turn
  end

  def outcome(human_guess, computer_guess) #directions are smaller or bigger
    if human_guess <= 0  || human_guess >= 100
      puts "You made an illegal move, guess again."
      turn
    elsif computer_guess == human_guess
      win
    elsif @count >= 4
      lose
      return
    elsif computer_guess > human_guess # bigger
      bigger
    elsif computer_guess < human_guess # smaller
      smaller
    end
  end

  def intro
    puts "********************************************************************"
    puts "**                                                                **"
    puts "**                    WELCOME TO GUESSING GAME                    **"
    puts "**                         by: Chet Corey                         **"
    puts "**                                                                **"
    puts "**             Guess my number it is between 1 and 100            **"
    puts "**                   I am giving you 5 chances                    **"
    puts "**                    Whats your first guess?                     **"
    puts "**                                                                **"
    puts "********************************************************************"
  end

  def win
    puts "************************"
    puts "**                    **"
    puts "**       WINNER       **"
    puts "**                    **"
    puts "************************"
    @count = 5
    @player << "WIN"
  end

  def lose
    puts "************************"
    puts "**                    **"
    puts "**      GAME OVER     **"
    puts "**                    **"
    puts "************************"
    puts "The correct guess was #{@computer_guess}"
    @player << "LOSE"
  end

  def bigger
    puts "========================"
    puts "||    guess bigger    ||"
    puts "||         /\\         ||"
    puts "||        /  \\        ||"
    puts "||       /    \\       ||"
    puts "||      /__  __\\      ||"
    puts "||        |  |        ||"
    puts "||        |  |        ||"
    puts "||        |__|        ||"
    puts "========================"
  end

  def smaller
    puts "========================"
    puts "||    guess smaller   ||"
    puts "||         __         ||"
    puts "||        |  |        ||"
    puts "||        |  |        ||"
    puts "||      __|  |__      ||"
    puts "||      \\      /      ||"
    puts "||       \\    /       ||"
    puts "||        \\  /        ||"
    puts "||         \\/         ||"
    puts "========================"
  end

  def guesses_remaining
    @count += 1
    if @count < 5
      puts "You have #{5 - @count} #{'guess'.pluralize(5 - @count)} left."
      turn
    end
  end

  def replay
    @count = 0
    @computer_guess = rand(1..100)
    play
  end
end
