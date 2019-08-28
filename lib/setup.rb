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

  def initiate_game(board)
    # put place computer ships and place player ships in this method
    place_computer_ships
    place_players_ships
    display_winner
    main_menu
  end

  def generate_random_coordinates
    # range of coordinates to array, sample (3)
    coordinates = board.cells.keys
    coordinates.to_a.sample(3)
  end

  def place_computer_ships(board)
    # generate random coordinates?
    until coordinates.valid_placement?
      generate_random_coordinates
      if coordinates.valid_placement?
        @board.place(ship, coordinates)
        # when ships are placed at valid positions
      else
        # generate random coordinates again until valid
        generate_random_coordinates
        coordinates
      end
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
    until input.valid_placement?
      if input.valid_placement?
        @board.place(ship, coordinates)
        # loop back up to input again to ask a second time

      else
        puts "Enter valid coordinates for your ships. Ships can be placed horizontally or diagonally in empty spaces but may not be placed diagonally."
        input = gets.chomp
      end
    end
  end

  def display_winner(winner)
    @winner = winner
  end

  def end_game

  end
end

# research how to generate random stuff (coordinats, hit coordinates, look back at valid_placement? method to maek sure cells are lined up properly)
# look up range function
