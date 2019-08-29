require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/setup'

class SetupTest < Minitest::Test

  def setup
    assert_instance_of Setup, @setup
  end

  def test_computer_places_valid_ships
    assert_equal 
  end
end
