require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require './lib/cell'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    # @cells = Cell.new('B4')
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  # def test_if_coordinates_valid
  #   assert_equal true, @board.valid_coordinate?(coordinate)
  # end
end
