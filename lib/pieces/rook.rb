class Rook < Piece
  private
  def set_moves(board)
    #TODO
  end

  def set_unicode
    if team == "white"
      @show = "\u265c"
    else
      @show = "\u2656"
    end
  end
end
