require_relative 'printer.rb'
require_relative 'point'
require 'set'
require 'curses'

class Board

  include Printer
  attr_reader :points

  def initialize
    @points = Set.new
  end

  def add_point(point)
    @points << point if !on_board?(point)
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
  def alive_neighbors(point)
    point.candidates & @points
  end

  def decide(point)
    if on_board?(point) then
      will_survive?(point)
    else
      will_born?(point)
    end
  end

  def next_round
    board_new = Board.new
    @points.each{|point|
      board_new.add_point point if self.decide(point)
      point.candidates.each { |neigh|
        board_new.add_point neigh if self.decide(neigh)
      }
    }
    board_new
  end

  def equal?(other)
    @points == other.points
  end

  def ==(other)
    equal? other
  end

  private

  def will_survive?(point)
    return false if !on_board?(point)
    alive_neighbors(point).count.between?(2, 3) ? true : false
  end

  def will_born?(point)
    return true if on_board?(point)
    alive_neighbors(point).count == 3 ? true : false
  end

end
