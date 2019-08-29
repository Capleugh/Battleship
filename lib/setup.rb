require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'

class Setup

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @turn = Turn.new(@computer_board, @player_board)
  end

  def main_menu
    loop do
      puts "Welcome to BATTLESHIP
      Enter p to play. Enter q to quit."
      input = gets.chomp.downcase
      if input == "p"
        start
        break
      elsif input == "q"
        puts "Bye!"
        break
      else
        puts "Please type p or q."
        input = gets.chomp.downcase
      end
    end
  end

  def start
    place_computer_ships
    place_player_ships
    take_turns
  end

  def generate_random_coordinates
    coordinates = @computer_board.cells.keys
    random_coordinates = coordinates.to_a.sample(3)
  end

  def place_computer_ships
    coordinates = generate_random_coordinates
    generate_random_coordinates
    if @computer_board.valid_placement?(@computer_cruiser, coordinates)
      @board.place(@computer_cruiser, coordinates)
    else
      generate_random_coordinates
    end
  end
  end

  def place_player_ships
    puts "I have laid out my ships on the grid.
    You now need to lay out your two ships.
    The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.b_render
    puts "Enter the squares for the Cruiser (3 spaces):
    >"
    input = gets.chomp.upcase.split.to_a
    # until @player_board.valid_placement?(@player_cruiser, input)
      if @player_board.valid_placement?(@player_cruiser, input)
        @player_board.place(@player_cruiser, input)
      else
        puts "Enter valid coordinates for your ships. Ships can be placed horizontally or diagonally in empty spaces but may not be placed diagonally."
        input = gets.chomp.upcase.split.to_a
      end
    # end
  end

  def take_turns
    @turn.select_coordinate
    @turn.initiate_player_hit(coordinate_input)
    @turn.initiate_computer_hit(coordinate_input)
    @turn.check_winner
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
