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

  def all_numbers_consecutive?(coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[1].to_i
    end

    numbers.each_cons(2).all? {|x,y| x == y - 1}
  end

  def all_numbers_same?(coordinates)
    numbers = coordinates.map do |coordinate|
      coordinate[1].to_i
    end

    numbers.uniq.count == 1
  end

  def all_letters_consecutive?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord
  end
    letters.each_cons(2).all? {|x,y| x == y - 1}
  end

  def all_letters_same?(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0].ord
  end
    letters.uniq.count == 1
  end

  def valid_row?(coordinates)
    all_numbers_consecutive?(coordinates) && all_letters_same?(coordinates)
  end

  def valid_column?(coordinates)
    all_letters_consecutive?(coordinates) && all_numbers_same?(coordinates)
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate) && @cells[coordinate].empty?
  end

  def valid_placement?(ship, coordinates)
    all_coordinates = coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end

    if ship.length == coordinates.length && all_coordinates
      valid_row?(coordinates) ^ valid_column?(coordinates)
    else
      false
    end
  end
end
