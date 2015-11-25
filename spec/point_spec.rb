require_relative 'spec_helper'

describe Point do
  describe "initialize" do
    it "x,y should return initialized data" do
      point = Point.new(10,20)
      expect(point.x).to eq(10)
      expect(point.x).to eq(10)
    end
  end

  describe "#candidates" do
    it "should return array of candidates for given points" do
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
      expect(point.candidates.count).to eq(8)
      expect(point.candidates).to match_array(expected_neighbors)
    end
  end
end