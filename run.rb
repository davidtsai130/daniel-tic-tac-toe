require 'pry'
require_relative 'environment.rb'

class Runner

@@last_move = " "

  def run
    intro = Intro.new
    player_and_computer = intro.run

    loop do
      board = MakeBoard.new(9).run
      print_board = PrintBoard.new(board).run
      loop do 
        break if Board.won?(board) == true || Board.filled?(board) == true
          PlayerMove.new(player_and_computer[:player], board).run
           puts "#{player_and_computer[:player].name}'s move"
          PrintBoard.new(board).run
          @@last_move = player_and_computer[:player].symbol
        break if Board.won?(board) == true || Board.filled?(board) == true
          ComputerMove.new(player_and_computer[:computer], board).run
           puts "Computer's move"
          PrintBoard.new(board).run
          @@last_move = player_and_computer[:computer].symbol
      end
      gameover = GameOver.new(player_and_computer, @@last_move, board)
      # gameover.run
      break if gameover.run == false
    end
      puts "Thanks for playing!"
  end 

end 

Runner.new.run

Pry.start