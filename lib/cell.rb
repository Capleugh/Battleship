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

  # def render(show = false)
  #   if @fired_upon == false
  #     if show == true
  #       "S"
  #     else
  #       "."
  #     end
  #   elsif @fired_upon == true
  #     if show == false && @ship == nil
  #       "M"
  #     else show == false && @ship != nil
  #       if @ship.health >= 1
  #         "H"
  #       else @ship.health <= 0
  #         "X"
  #       end
  #     end
  #   end
  # end

# test writing with empty? and sunk?
  def render(show = false)
    if fired_upon?
      if @ship == nil
        "M"
      else @ship != nil
        if @ship.health >= 1
          "H"
        else @ship.health <= 0
          "X"
        end
      end
    else
      if show == true
        "S"
      else
        "."
      end
    end
  end
end
