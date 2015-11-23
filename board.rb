require_relative 'point'
require 'set'
require 'curses'

class Board

  attr_reader :points

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

  def decide(point)
    if on_board?(point) then
      czy_przezyje(point)
    else
      czy_urodzi_sie(point)
    end
  end

  def next_round
    board_new = Board.new
    @points.each{|point|
      board_new.add_point point if self.decide(point)
      point.neighbors.each { |neigh|
        board_new.add_point neigh if self.decide(neigh)
      }
    }
    board_new
  end

  def print
    Curses.init_screen
    Curses.close_screen
    # begin
      @points.each{ |point|
        Curses.setpos(point.x, point.y)  # column 6, row 3
        Curses.addstr("X")
      }
    Curses.refresh
      # Curses.getch  # Wait until user presses some key.
    # ensure

    # end
  end

  def equal?(other)
    @points == other.points
  end

  def ==(other)
    equal? other
  end
end