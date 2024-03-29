require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @coords = ["A1", "A2", "A3"]
    @coords_2 = ["A1", "A2", "A4"]
    @coords_3 = ["A1", "B1", "C1"]
    @coords_4 = ["A1", "B1", "B2"]
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_validates_coordinates
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")

    @board.place(@cruiser, ["A1", "A2", "A3"])

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_number_of_coordinates_in_array_equals_ship_length
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, @coords)
  end

  def test_all_numbers_consecutive
    assert @board.all_numbers_consecutive?(@coords)
    refute @board.all_numbers_consecutive?(@coords_2)
  end

  def test_all_numbers_same
    assert @board.all_numbers_same?(@coords_3)
    refute @board.all_numbers_same?(@coords)
  end

  def test_all_letters_consecutive
    assert @board.all_letters_consecutive?(@coords_3)
    refute @board.all_letters_consecutive?(@coords_4)
  end

  def test_all_letters_same
    assert @board.all_letters_same?(@coords)
    refute @board.all_letters_same?(@coords_4)
  end

  def test_valid_row
    assert @board.valid_row?(@coords)
    refute @board.valid_row?(@coords_4)
  end

  def test_valid_column
    assert @board.valid_column?(@coords_3)
    refute @board.valid_column?(@coords_4)
  end

  def test_ships_do_not_overlap
    @board.place(@cruiser, @coords)

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_coordinates_are_consecutive
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A1", "C1"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_coordinates_cannot_be_diagonal
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_it_has_valid_placement
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_ship_in_its_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert cell_3.ship == cell_2.ship
  end

  def test_it_can_render_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal "1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.b_render
    assert_equal "1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.b_render(true)
  end
end
