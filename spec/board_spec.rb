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
    xit
  end

  describe "#move" do

    context "valid move" do
      xit "updates the arr" do
      end
    end

    context "invalid move" do
      xit "returns false" do
      end
    end

    context "castle" do
      xit "correctly changes arr" do
      end
    end
  end



end
