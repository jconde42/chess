class Knight
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
      @show = "\u254e"
    else
      @show = "\u2548"
    end
  end
end
