class PlayerMove
  
  attr_accessor :player, :board, :move

  def initialize(player, board)
    # PrintBoard.new(board).run
    @board = board 
    @player = player #gives access to symbol
  end 

  def ask_for_move
    puts "Please move into empty space (1-9)."
  end 

  def gets_move 
    @move = gets.chomp.to_i - 1
  end 

  def valid_move? 
    board[@move].value == " " && (@move >= 0 && @move <= 9) ? true : false
  end 

  def put_on_board
    board[@move].value = @player.symbol
  end 

  def run 
    ask_for_move
    gets_move
    until valid_move? 
      gets_move
    end 
      put_on_board
  end 



end 