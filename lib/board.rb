require './lib/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
      }
  end

  def all_numbers_consecutive?(coords)
    numbers = coords.map do |coord|
      coord[1].to_i
    end

    numbers.each_cons(2).all? {|x,y| x == y - 1}
  end

  def all_numbers_same?(coords)
    numbers = coords.map do |coord|
      coord[1].to_i
    end

    numbers.uniq.count == 1
  end

  def all_letters_consecutive?(coords)
    letters = coords.map do |coord|
      coord[0].ord
  end
    letters.each_cons(2).all? {|x,y| x == y - 1}
  end

  def all_letters_same?(coords)
    letters = coords.map do |coord|
      coord[0].ord
  end
    letters.uniq.count == 1
  end

  def valid_row?(coords)
    if all_numbers_consecutive?(coords) == true && all_letters_same?(coords) == true
      true
    else
      false
    end
  end

  def valid_column?(coords)
    if all_letters_consecutive?(coords) == true && all_numbers_same?(coords) == true
      true
    else
      false
    end
  end

  def valid_coordinate?(coordinate)
    if @cells.has_key?(coordinate) && @cells[coordinate].empty?
      true
    else
      false
    end
  end

  def valid_placement?(ship, coords)
    all_coords = coords.all? do |coord|
      valid_coordinate?(coord)
    end

    if ship.length == coords.length && all_coords
      valid_row?(coords) ^ valid_column?(coords)
    else
      false
    end
  end
end
