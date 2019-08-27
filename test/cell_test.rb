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
    assert @cell.empty?
    @cell.place_ship(@cruiser)
    refute @cell.empty?
  end

  def test_if_ship_can_be_placed
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
  end

  def test_it_can_be_fired_upon
    refute @cell.fired_upon?

    @cell.fire_upon
    assert @cell.fired_upon?
  end

  def test_fire_upon_decreases_health
    @cell.place_ship(@cruiser)
    assert_equal 3, @cell.ship.health

    @cell.fire_upon
    assert_equal 2, @cell.ship.health
  end

  def test_it_can_render_space_not_fired_upon
    assert_equal ".", @cell.render
  end

  def test_it_can_render_a_miss
    @cell.fire_upon
    assert_equal "M", @cell.render
  end

  def test_it_can_render_a_hit
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal "H", @cell.render
  end

  def test_it_can_render_a_sunk_ship
    cruiser = Ship.new("Cruiser", 1)
    @cell.place_ship(cruiser)
    @cell.fire_upon

    assert_equal "X", @cell.render
  end

  def test_it_can_show_ship
    @cell.place_ship(@cruiser)

    assert_equal "S", @cell.render(true)
  end
end
 
