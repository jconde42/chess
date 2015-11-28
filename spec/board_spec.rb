require "spec_helper"


describe Board do

  let(:board) { Board.new }

  describe "#display" do
    it "shows the board" do
      expect{board.display}.to \
        output("---------CHESS---------\n\n   " + \
               " a| b| c| d| e| f| g| h\n" + \
               "8 |♖ |♘ |♗ |♕ |♔ |♗ |♘ |♖ |\n" + \
               "7 |♙ |♙ |♙ |♙ |♙ |♙ |♙ |♙ |\n" + \
               "6 | .| .| .| .| .| .| .| .|\n" + \
               "5 | .| .| .| .| .| .| .| .|\n" + \
               "4 | .| .| .| .| .| .| .| .|\n" + \
               "3 | .| .| .| .| .| .| .| .|\n" + \
               "2 |♟ |♟ |♟ |♟ |♟ |♟ |♟ |♟ |\n" + \
               "1 |♜ |♞ |♝ |♛ |♚ |♝ |♞ |♜ |\n   " + \
               " a| b| c| d| e| f| g| h\n\n").to_stdout
    end
  end

  describe "#find" do
    context "valid coordinate" do
      it "returns the correct piece" do
        board2 = Board.new
        expect(board2.find([0,1])).to be_a(Pawn)
        expect(board2.find([0,0])).to be_a(Rook)
      end
    end

    context "invalid coordinate" do
      it "returns false" do
        expect(board.find([9,9])).to be false
      end
    end
  end

  describe "#move" do
    before :all do
      @piece_post = Pawn.new(position: [4,2], team: "white")
      @piece_pre_position = [4,1]
      @target_position = [4,2]
    end

    it "moves to the correct square" do
      board.move(piece_post: @piece_post, \
                piece_pre_position: @piece_pre_position)

      expect{board.display}.to \
        output("---------CHESS---------\n\n   " + \
               " a| b| c| d| e| f| g| h\n" + \
               "8 |♖ |♘ |♗ |♕ |♔ |♗ |♘ |♖ |\n" + \
               "7 |♙ |♙ |♙ |♙ |♙ |♙ |♙ |♙ |\n" + \
               "6 | .| .| .| .| .| .| .| .|\n" + \
               "5 | .| .| .| .| .| .| .| .|\n" + \
               "4 | .| .| .| .| .| .| .| .|\n" + \
               "3 | .| .| .| .|♟ | .| .| .|\n" + \
               "2 |♟ |♟ |♟ |♟ | .|♟ |♟ |♟ |\n" + \
               "1 |♜ |♞ |♝ |♛ |♚ |♝ |♞ |♜ |\n   " + \
               " a| b| c| d| e| f| g| h\n\n").to_stdout
    end
  end



end
