require_relative 'point'
require_relative 'board'
require 'matrix'

board = Board.new

def random(board)

  Random.new.rand(60..150).times {
    board.add_point(Point.new(Random.new.rand(20..40),Random.new.rand(5..20)))
  }
end

def glider(board)
  matrix = Matrix[
      [0,0,0,1,0,0],
      [0,0,0,0,0,0],
      [0,0,0,0,0,0],
  ]

  matrix.each_with_index { |el,row,col | board.add_point(Point.new(row,col)) if el==1  }
end

 random(board)
# glider(board)
loop do
  Printer.print_board board
  sleep 0.01
  board = board.next_round
end


