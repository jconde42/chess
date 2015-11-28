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
    xit "returns a board object" do
     # board = Board.new
     # board.display
     # target_position = [0,2]
     # pawn = Pawn.new(team: "white", position: [0,1])
     # p pawn
     # board2 = pawn.move(board: board, target_position: target_position)
     # board2.display

     # expect(board).not_to eq(board2)
     # 
    end
  end

end
#It sends  Command messages
