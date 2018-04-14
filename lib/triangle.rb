class Triangle
  attr_reader :length_one, :length_two, :length_three

  def initialize(length_one, length_two, length_three)
    @length_one = length_one
    @length_two = length_two
    @length_three = length_three
  end

  def kind
    if length_one == length_two && length_two == length_three
      return :equilateral
    elsif length_one != length_two && length_two != length_three && length_one != length_three
      return :scalene
    else
      return :isosceles
    end
  end

  def validate_triangle
    real_triangle = [(length_one + length_two > length_three), (length_one + length_three > length_two), (length_two + length_three > length_one)]
    [length_one, length_two, length_three].each { |side| real_triangle << false if side <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end

end
