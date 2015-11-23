class Bishop
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
      @show = "\u265d"
    else
      @show = "\u2657"
    end
  end
end
