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

  def on_board?(point)
    @points.include? point
  end

  # Get alive nighbers
  #
  # @param [Point] fooo
  def alive_neighbers(point)
    point.neighbors & @points
  end

  def czy_przezyje(point)
    return false if !on_board?(point)
    alive_neighbers(point).count.between?(2,3) ? true : false
  end

  def czy_urodzi_sie(point)
    return true if on_board?(point)
    alive_neighbers(point).count == 3 ? true : false
  end

  def next_round
    @points
  end
end