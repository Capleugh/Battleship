require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  def main_menu
    loop do
      puts "Welcome to BATTLESHIP
      Enter p to play. Enter q to quit."
      input = gets.chomp.downcase
      if input == "p"
        start
      elsif input == "q"
        puts "Bye!"
        break
      else
        puts "Please type or p or q."
        input = gets.chomp.downcase
      end
    end
  end

  def start
    place_computer_ships
    place_player_ships
    take_turns
  end

  # def initiate_game(computer_board, player_board)
  #   # put place computer ships and place player ships in this method
  #   # place_computer_ships
  #   # place_players_ships
  #   # display_winner
  #   # main_menu
  # end

  def generate_random_coordinates
    coordinates = @computer_board.cells.keys
    random_coordinates = coordinates.to_a.sample(3)
  end

  def place_computer_ships
    generate_random_coordinates
  # until coordinates.valid_placement?
    # generate_random_coordinates
    if coordinates.valid_placement?
      @board.place(ship, coordinates)
      # when ships are placed at valid positions
    else
      generate_random_coordinates
    end
  end

  def place_player_ships
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

  def take_turns
    # take turns until one player's ships are all sunk
  end

  def display_winner(winner)
    @winner = winner
  end

  def end_game
    if @winner == @player
      puts "You won!"
      main_menu
    else
      puts "I won!"
      main_menu
  end
end
end
# research how to generate random stuff (coordinats, hit coordinates, look back at valid_placement? method to maek sure cells are lined up properly)
# look up range function
