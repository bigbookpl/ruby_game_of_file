require_relative 'point'
require 'set'

class Board

  def initialize
    @points = Set.new
  end

  def add_point(point)
    @points << point
  end

  def count
    @points.count
  end

  # Get alive nighbers
  #
  # @param [Point] fooo
  def alive_neighbers(point)
    point.neighbors & @points
  end
end