require "spec_helper"


describe Piece do

  let(:piece) { Piece.new(
    position: [0,0],
    team:     "white"
  )}

  #Its public interface"
  describe "#position" do
    it "return position on board" do
      expect(piece.position).to eq([0,0])
    end
  end

  describe "#team" do
    it "sets @team" do
      expect(piece.team).to eq("white")
    end
  end

  describe "#move" do
    xit "" do
    end
  end

end
#It sends  Command messages
