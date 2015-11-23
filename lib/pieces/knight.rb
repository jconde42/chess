class Knight < Piece
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
      @show = "\u265e"
    else
      @show = "\u2658"
    end
  end
end
