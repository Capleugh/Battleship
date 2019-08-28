class Setup

  def initialize(board)
    @board = board
  end

  def main_menu
    puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."
    input = gets.chomp.downcase
    until input == "p" || input == "q"
      if input = "p"
        # initiate game
        place_computer_ships(board)
      elsif input = "q"
        puts "Bye!"
      else
        puts "Please type or p or q."
        input = gets.chomp.downcase
      end
    end
  end

  def initiate_game
    # put place computer ships and place player ships in this method
  end

  def place_computer_ships(board)
    # generate random coordinates?
    if coordinates.valid_placement?
      @board.place(ship, coordinates)
      # when ships are placed at valid positions, trigger player ship placement
    else
      # generate random coordinates again until valid
    end
  end

  def place_player_ships(board)
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is two units long and the Submarine is three units long."
    puts board.b_render
    puts "Enter the squares for the Cruiser (3 spaces):
    >"
    input = gets.chomp
    if input.valid_placement?
      @board.place(ship, coordinates)
      # loop back up to input again to ask a second time
    else
      puts "Enter valid coordinates for your ships. Ships can be placed horizontally or diagonally in empty spaces but may not be placed diagonally."
      # loop back up to input
    end
  end
end
