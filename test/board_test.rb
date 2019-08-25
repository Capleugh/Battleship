require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

require 'pry'
require './lib/board'
# require './lib/cell'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    skip
    assert_instance_of Board, @board
  end

  def test_it_validates_coordinates
    skip
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_number_of_coordinates_in_array_equals_ship_length
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_all_numbers_consecutive
    coords = ["A1", "A2", "A3"]
    coords_2 = ["A1", "A2", "A4"]
    assert_equal true, @board.all_numbers_consecutive?(coords)
    assert_equal false, @board.all_numbers_consecutive?(coords_2)
  end

  def test_all_numbers_same
    coords_3 = ["A1", "B1", "C1"]
    coords_4 = ["A1", "B1", "B2"]
    assert_equal true, @board.all_numbers_same?(coords_3)
    assert_equal false, @board.all_numbers_same?(coords_4)
  end

  def test_all_letters_consecutive
    coords_3 = ["A1", "B1", "C1"]
    coords_4 = ["A1", "B1", "B2"]
    assert_equal true, @board.all_letters_consecutive?(coords_3)
    assert_equal false, @board.all_letters_consecutive?(coords_4)
  end

  def test_all_letters_same
    coords = ["A1", "A2", "A3"]
    coords_4 = ["A1", "B1", "B2"]
    assert_equal true, @board.all_letters_same?(coords)
    assert_equal false, @board.all_letters_same?(coords_4)
  end

  def test_valid_row
    skip
    assert_equal true, @board.valid_row?(@cruiser, ["A1", "A2", "A3"])
  end

  def test_valid_column
    skip
  end

  def test_coordinates_are_consecutive
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_coordinates_cannot_be_diagonal
    skip
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_it_has_valid_placement
    skip
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_ship_in_its_cells
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_do_not_overlap
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end
end
