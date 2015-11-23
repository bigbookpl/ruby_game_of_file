require_relative 'point'
require_relative 'board'

b = Board.new
b.add_point(Point.new(3,3) )
b.add_point(Point.new(4,4) )

b.add_point(Point.new(2,5) )
b.add_point(Point.new(3,5) )
b.add_point(Point.new(4,5) )

loop do
  b.print
  sleep 0.1
  b = b.next_round
end
