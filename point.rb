class Point
  attr_accessor :x, :y
  include Comparable

  def initialize(x, y)
    @result = Set.new
    @x, @y = x, y
  end

  #
  # @return [Set<Point>]
  def candidates()
    @result.clear
    (@x-1).upto(@x+1) { |x|
      (@y-1).upto(@y+1) { |y|
        @result << Point.new(x, y)
      }
    }
    @result.delete_if { |point|
      point == self
    }
    return @result
  end

  def to_s
    "[#{@x}, #{@y}]"
  end

  def inspect
    self.to_s
  end

  def eql?(anAnother)
    (self.x == anAnother.x) && (self.y == anAnother.y)
  end

  def == (anAnother)
    eql? anAnother
  end

  def hash
    "#{@x}#{@y}".to_i
  end
end