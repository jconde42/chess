class Pawn < Piece
  def move(arg)
    #TODO
    target = arg[:target]
    board = arg[:board]

  end

  private
  def set_moves(board)
    #TODO
  end
  
  def set_unicode
    if team == "white"
      @show = "\u265f"
    else
      @show = "\u2659"
    end
  end
end
