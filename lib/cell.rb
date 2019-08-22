class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
    # describes the default state of not being fired upon
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
    # this is a reader method and how all reader methods are formatted without an attr_reader we don't want to put it in the reader because the reader doesn't need this information.
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.hit
    end
  end
end
