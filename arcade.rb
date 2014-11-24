load "./guessing_game.rb"
# require "blackjack.rb"

class Arcade
  attr_accessor :points, :player_name

  def initialize
    @player_name = "player 1"
    @points = 100
  end

  def menu
    puts "******************************************************"
    puts "**                                                  **"
    puts "**              WELCOME TO RUBY ARCADE              **"
    puts "**           WHAT WOULD YOU LIKE TO PLAY?           **"
    puts "**                                                  **"
    puts "******************************************************"
    puts "Chose your game by typing the number"
    puts "1. Guessing Game"
    puts "2. BLackjack"
    puts "Type exit to leave at any time"
    responce = gets.chomp
    if responce == "1"
      @player = GuessingGame.new
    elsif responce == "2"
      @player = Blackjack.new
    else
      menu
    end
    @player.play
    games
  end

  def games
    puts "Would you like to play again (1), go to the game menu (2) or exit (exit)?"
    responce = gets.chomp
    if responce == '1'
      @player.replay
      games
    else
      menu
    end
  end
end

Arcade.new.menu
