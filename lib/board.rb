require './lib/cell'
# require './lib/ship'

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
  
  def valid_coordinate?(coordinate)
    if @cells.has_key?(coordinate)
      true
    else
      false
    end
  end

  # def array_equals_length
  #
  # end


  # array = @cells.keys.to_a
  # array.each do |coord|
  #   coord.chars
  #
  # if
  # end

  # def all_numbers_consecutive?(coords)
  #   cells = @cells.keys.to_a
  #   numbers = cells.map do |coordinate|
  #     coordinate[1]
  #   end
  #   if #all numbers consecutive
  #     true
  #   else
  #     false
  #   end
  # end

  def all_numbers_consecutive?(coords)
    numbers = coords.map do |coord|
      coord[1].to_i
    end

    numbers.each_cons(2).all? {|x,y| x.to_i == y.to_i - 1}
  end
end
