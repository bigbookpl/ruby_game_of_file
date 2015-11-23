require_relative 'spec_helper'

  describe Point do
    it "set x and y on Point object" do
      point = Point.new(10,20)
      expect(point.x).to eq(10)
      expect(point.x).to eq(10)
    end

    it "should return neighber" do
      point = Point.new(1,2)
      expected_neighbors = [
              Point.new(0,1),
              Point.new(0,2),
              Point.new(0,3),
              Point.new(1,3),
              Point.new(2,3),
              Point.new(2,2),
              Point.new(2,1),
              Point.new(1,1)
      ]
      expect(point.neighbors.count).to eq(8)
      expect(point.neighbors).to match_array(expected_neighbors)
    end
  end

  describe Board do
    it "add points to board" do
      point_1 = Point.new(1, 3)
      point_2 = Point.new(3, 2)
      board = Board.new
      board.add_point point_1
      board.add_point point_2
      expect(board.count).to eq(2)
    end

    it "should return alive neighber" do
      board = Board.new
      board.add_point Point.new(1, 3)
      board.add_point Point.new(2, 2)

      alive = board.alive_neighbers(Point.new(1, 3))
      expect(alive.count).to eq(1)
    end

    it "should die when is on board and 1 live neighber given" do
      board = Board.new
      board.add_point Point.new(1, 1)
      board.add_point Point.new(1, 2)

      result = board.czy_przezyje(Point.new(1, 2))
      expect(result).to eq(false)
    end

    it "should stay alive when is on board and 3 live neighber given" do
      board = Board.new
      board.add_point Point.new(2, 3)
      board.add_point Point.new(4, 3)
      board.add_point Point.new(3, 3)

      result = board.czy_przezyje(Point.new(3, 3))
      expect(result).to eq(true)
    end

    it "should return true when point on board" do
      board = Board.new
      board.add_point Point.new(1, 3)
      board.add_point Point.new(2, 2)

      result = board.on_board?(Point.new(1, 3))
      expect(result).to eq(true)
    end

    it "should born when 3 live neighber given" do
      board = Board.new
      board.add_point Point.new(2, 3)
      board.add_point Point.new(4, 3)
      board.add_point Point.new(4, 4)

      result = board.czy_urodzi_sie(Point.new(3, 3))
      expect(result).to eq(true)
    end

    it "should set new board when next_round" do
      board = Board.new
      board.add_point Point.new(2, 3)
      board.add_point Point.new(4, 3)
      board.add_point Point.new(4, 4)

      board_new = Board.new
      board_new.add_point Point.new(3, 3)
      board_new.add_point Point.new(3, 4)

      result = board.next_round()
      expect(result).to eq(board_new)
    end


  end
