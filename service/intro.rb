class Intro
  attr_reader :player, :computer

  def make_player
    puts "What is your name?"
    @player = Player.new(gets.chomp.capitalize)
    until @player.symbol=="X" || @player.symbol=="O"
     puts "Do you want X or O?"
     @player.symbol = gets.chomp.upcase 
    end 
  end 

  def make_computer
    @computer = Computer.new
    @player.symbol == "X" ? @computer.symbol="O" : @computer.symbol = "X"

  end 

  def run 
   make_player
   make_computer
    {player: @player, computer: @computer}
  end 



end 
