class ComputerMove

attr_accessor :computer, :board

  def initialize(computer, board)
    @computer = computer
    @board = board
  end

  def generate_move
    avail_spots = @board.each_with_index.map do |elem, index|
      index if elem.value == " "
    end
    computer_move = avail_spots.compact.sample
    @board[computer_move].value = computer.symbol
  end

  def run
    generate_move
  end

end 