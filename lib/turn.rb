class Turn

  def initialize(board_1, board_2)
    @computer_board = board_1
    @player_board = board_2
  end

  def select_coordinate
    puts "Enter the coordinate for your shot:"
    coordinate_input = gets.chomp

    until @computer_board.valid_coordinate?(coordinate_input) do
      puts "Please enter a valid coordinate:"
      coordinate_input = gets.chomp
    end

    # you want to test your hit on computer's board
    # while loop
    # instance variable for computer board and player board
  end

  def initiate_player_hit(coordinate_input)
    @computer_board.cell[coordinate_input].fire_upon
    if @computer_board.cell[coordinate_input].render == "M"
      puts "Your shot on #{coordinate_input} was a miss."
    elsif @computer_board.cell[coordinate_input].render == "H"
      puts "Your shot on #{coordinate_input} was a hit."
    elsif @computer_board.cell[coordinate_input].render == "X"
      puts "Your shot on #{coordinate_input} sunk your opponent's ship."
    end
  end

  def check_winner
    if @computer_board.ship.sunk?
      puts "You win!"
    elsif @player_board.ship.sunk?
      puts "You lose!"
    end
  end

  def initiate_computer_hit(coordinate_input)
    @player_board.cell[coordinate_input].fire_upon
    if @player_board.cell[coordinate_input].render == "M"
      puts "Your shot on #{coordinate_input} was a miss."
    elsif @player_board.cell[coordinate_input].render == "H"
      puts "Your shot on #{coordinate_input} was a hit."
    elsif @player_board.cell[coordinate_input].render == "X"
      puts "Your shot on #{coordinate_input} sunk your opponent's ship."
    end
    # research random hit
    # no shot on same cell
  end

  # show both boards while debugging. write separate method for this
end
