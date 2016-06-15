class Board
  attr_accessor :comp, :board

  def initialize
    @comp = []
  end 

  def self.won?(board)
  winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    winning.each do |array|
      if board[array[0]].value != " " && board[array[0]].value == board[array[1]].value && board[array[1]].value == board[array[2]].value
        return true
      end
    end
  end

  def self.filled?(board)
   board.each_with_object([]) do |space_object, array|
      array << space_object.value
    end.include?(" ") ? false : true
  end


end 

