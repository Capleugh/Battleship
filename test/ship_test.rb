require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
  end

  def test_health_starts_equal_to_length
    assert_equal 3, @cruiser.health
  end

  def test_sunk?
    assert_equal false, @cruiser.sunk?
  end

  def test_a_hit_can_decrease_health
    assert_equal 3, @cruiser.health

    @cruiser.hit
    assert_equal 2, @cruiser.health

    @cruiser.hit
    assert_equal 1, @cruiser.health

    @cruiser.hit
    assert_equal 0, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
  end

  def test_it_can_be_sunk
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    assert @cruiser.sunk?
  end
end
     
