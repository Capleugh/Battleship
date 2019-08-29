require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @computer_board = Board.new
    @player_board = Board.new
    @turn =Turn.new(@computer_board, @player_board)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
    assert_instance_of Board, @computer_board
    assert_instance_of Board, @computer_board
  end

  def test_board_renders
    player = "  1 2 3 4 \n" +
             "A . . . . \n" +
             "B . . . . \n" +
             "C . . . . \n" +
             "D . . . . \n"

    computer = "  1 2 3 4 \n" +
               "A . . . . \n" +
               "B . . . . \n" +
               "C . . . . \n" +
               "D . . . . \n"
    assert_equal player, @player_board.b_render(show = true)
    # assert_equal computer, @computer_board.b_render

  end
end
