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

    if ship.length == coordinates.size && all_coordinates
      valid_row?(coordinates) ^ valid_column?(coordinates)
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
      end
    end
  end

  def b_render(show = false)
    "1 2 3 4 \n\
A #{@cells["A1"].render(show)} #{@cells["A2"].render(show)} #{@cells["A3"].render(show)} #{@cells["A4"].render(show)} \n\
B #{@cells["B1"].render(show)} #{@cells["B2"].render(show)} #{@cells["B3"].render(show)} #{@cells["B4"].render(show)} \n\
C #{@cells["C1"].render(show)} #{@cells["C2"].render(show)} #{@cells["C3"].render(show)} #{@cells["C4"].render(show)} \n\
D #{@cells["D1"].render(show)} #{@cells["D2"].render(show)} #{@cells["D3"].render(show)} #{@cells["D4"].render(show)} \n"
  end
end
