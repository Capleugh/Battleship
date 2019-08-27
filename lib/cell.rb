class Cell

attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
      @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.hit
    end
  end

  def render(show = false)
    if fired_upon?
      if empty?
        "M"
      else
        if ship.sunk?
          "X"
        else
          "H"
        end
      end
    elsif show == true && @ship
      "S"
    else
      "."
    end
  end
end
 
