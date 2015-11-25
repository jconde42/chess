class King < Piece
  def move(arg)

    #TODO king overides so it can castle
    target = arg[:target]
    board = arg[:board]
    castle = arg.fetch(:castle, false)

  end

  private
  def set_moves(board)
    #TODO
  end
  
  def set_unicode
    if team == "white"
      @show = "\u265a"
    else
      @show = "\u2654"
    end
  end
end
