class GameOver
#identify and announce win, lose, tie
attr_accessor :board, :player_and_computer
attr_reader :last_move
  
  def initialize(player_and_computer, last_move, board)
    @board = board
    @last_move = last_move
    @player_and_computer = player_and_computer
  end

  def announce
    if Board.filled?(@board) == true && Board.won?(@board) != true
      draw?
    elsif Board.won?(@board) == true 
      show_winner
    end
  end

  def draw?
    puts "It's a draw"
      @player_and_computer[:player].stats[:ties] += 1
      puts @player_and_computer[:player].stats
  end

  def show_winner
    if @last_move == @player_and_computer[:player].symbol
    puts "#{@player_and_computer[:player].name} is the winner"
    @player_and_computer[:player].stats[:wins] += 1
    else
    puts "Computer is the winner"
    @player_and_computer[:player].stats[:losses] += 1
    end
    puts @player_and_computer[:player].stats
  end

  def restart?
    puts "Would you like to play again? Please enter yes or no"
    answer = gets.chomp.upcase
    answer == "YES"? true : false
  end


  def run
    announce
    restart?
  end


end 