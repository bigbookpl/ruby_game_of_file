require_relative 'spec_helper'

  describe Board do
    describe "#add_point" do

      it "should save points" do
          point_1 = Point.new(1, 3)
          point_2 = Point.new(3, 2)
          board = Board.new
          board.add_point point_1
          board.add_point point_2

          expect(board.count).to eq(2)
      end
    end

    describe "#alive_neighbors" do
      it "should return alive neighbors" do
        board = Board.new
        board.add_point Point.new(1, 3)
        board.add_point Point.new(2, 2)

        alive = board.alive_neighbors(Point.new(1, 3))
        expect(alive).to eq(Set.new([Point.new(2,2)]))
      end
    end

    describe "#on_board" do
      it "should return true when point is on board" do
        board = Board.new
        board.add_point Point.new(1, 3)
        board.add_point Point.new(2, 2)

        result = board.on_board?(Point.new(1, 3))
        expect(result).to eq(true)
      end

      it "should return false when point isn't on board" do
        board = Board.new
        board.add_point Point.new(1, 3)
        board.add_point Point.new(2, 2)

        result = board.on_board?(Point.new(3, 2))
        expect(result).to eq(false)
      end
    end

    describe "#next_round" do
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
  end
