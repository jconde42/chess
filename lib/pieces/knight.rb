class Knight < Piece

  def set_attacking_moves(board)
    x = @position[0]
    y = @position[1]
    @attacking_moves = []

    possible_attacking_moves = [
      [x+1, y+2],
      [x+1, y-2],
      [x+2, y+1],
      [x+2, y-1],
      [x-1, y+2],
      [x-1, y-2],
      [x-2, y-1],
      [x-2, y+1]
    ]

    possible_attacking_moves.each do |move|
      if valid_coordinate?(move)
        @attacking_moves.push(move)
      end
    end
  end

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

      if !board.arr[coordinate[0]][coordinate[1]].nil? && \
          board.arr[coordinate[0]][coordinate[1]].team != @team
        @moves.push(coordinate)
        next
      end
    end
  end

  private
  
  def set_unicode
    if team == "white"
      @show = "\u265e"
    else
      @show = "\u2658"
    end
  end
end
