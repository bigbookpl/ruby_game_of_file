module Printer
# :nocov:
  def Printer.print_board (board)
    Curses.noecho
    Curses.init_screen
    Curses.close_screen
    board.points.each { |point|
      Curses.setpos(1, 60)
      Curses.addstr("Count #{board.count}")
      Curses.setpos(point.y, point.x)
      Curses.addstr("+")
      Curses.refresh
    }

  end
end
