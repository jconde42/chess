class Pawn < Piece

  private
  def set_moves(board)
    #possible_moves = []
    @moves = []

    if team == "white"
     @moves.push([@position[0],@position[1]+1])
      
    else
    end
  end
  
  def set_unicode
    if team == "white"
      @show = "\u265f"
    else
      @show = "\u2659"
    end
  end
end
