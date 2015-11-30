class Knight < Piece

  private
  def set_moves(board)
    x = @position[0]
    y = @position[1]
    
    possible_moves = [
      [x+1, y+2],
      [x+1, y-2],
      [x+2, y+1],
      [x+2, y-1],
      [x-1, y+2],
      [x-1, y-2],
      [x-2, y-1],
      [x-2, y+1]
    ]

    possible_moves.each do |coordinate|
      if !valid_coordinate?(coordinate)
        next
      end

      if board.arr[coordinate[0]][coordinate[1]].nil?
        @moves.push(coordinate)
        next
      end

      if board.arr[coordinate[0]][coordinate[1]].team != @team
        @moves.push(coordinate)
        next
      end
    end

  end
  
  def set_unicode
    if team == "white"
      @show = "\u265e"
    else
      @show = "\u2658"
    end
  end
end
