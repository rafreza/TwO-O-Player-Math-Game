## Create player class, each player has 3 lives that are tracked
## Current player is tracked between the two players, either true of false
## Player 1 will always go first (true), player 2 will go after (initially false)
## Players can lose lives if they answer the question wrong.

require "./player.rb"
require "./question.rb"

class Game
  def initialize
    puts "Player 1, enter your name:"
    player1 = gets.chomp
    @player1 = Player.new(player1)

    puts "Player 2, enter your name:"
    player2 = gets.chomp
    @player2 = Player.new(player2)
  end

  def questionTime
    @newQ = Question.new
    puts "----- NEW TURN -----"
    if @player1.turn
      puts "#{@player1.name}: #{@newQ.newQ}"
    else
      puts "#{@player2.name}: #{@newQ.newQ}"
    end
  end

  def checkAns
    if gets.chomp.to_i == @newQ.ans
      if @player1.turn
        puts "YES! You are correct."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      else
        puts "YES! You are correct."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      end
    else
      if @player1.turn
        @player1.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = false
        @player2.turn = true
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      else
        @player2.lives -= 1
        puts "No! You are incorrect."
        @player1.turn = true
        @player2.turn = false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
        checkWinner
      end    
    end
  end

  def checkWinner
    if @player1.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3 "
      puts "Thank you, play again"
    elsif @player2.lives == 0
      puts "----- GAME OVER -----"
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3 "
      puts "Thank you, play again"
    else
      nextTurn
    end
  end

  def nextTurn
    questionTime
    checkAns
  end

end 

