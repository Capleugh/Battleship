require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_has_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_starts_with_no_ship
    assert_nil @cell.ship
  end

  def test_if_it_is_empty
    assert_equal true, @cell.empty?

    @cell.place_ship(@cruiser)
    assert_equal false, @cell.empty?
  end

  def test_if_ship_can_be_placed
    assert_nil @cell.ship

    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_if_fired_upon
    assert_equal false, @cell.fired_upon?


    @cell.fire_upon
    assert_equal true, @cell.fired_upon?
  end

  def test_fire_upon_decreases_health
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    assert_equal 2, @cell.ship.health
  end
end
