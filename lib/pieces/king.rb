class King < Piece
  def special_hook(arg)
    #TODO castleing
    #  target_position = arg[:target_position]
    #  board = arg[:board]
  end

  def set_attacking_moves(board)
    x = @position[0]
    y = @position[1]
    @attacking_moves = []

    possible_attacking_moves = [
      [x,y+1],
      [x+1,y+1],
      [x+1,y],
      [x+1,y-1],
      [x,y-1],
      [x-1,y-1],
      [x-1,y],
      [x-1,y+1]
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
      [x,y+1],
      [x+1,y+1],
      [x+1,y],
      [x+1,y-1],
      [x,y-1],
      [x-1,y-1],
      [x-1,y],
      [x-1,y+1]
    ]

    possible_moves.each do |move|
      if !valid_coordinate?(move)
        next
      end

      not_being_attacked = board.clear?(arr: move, team: @team)

      #empty square if not being attacked
      if board.arr[move[0]][move[1]].nil? && \
          not_being_attacked
        @moves.push(move)
        next
      end

      #enemy not being protected
      if !board.arr[move[0]][move[1]].nil? && \
          board.arr[move[0]][move[1]].team != @team && \
          not_being_attacked
        @moves.push(move)
        next
      end
    end
  end

  private

  def set_unicode
    if team == "white"
      @show = "\u265a"
    else
      @show = "\u2654"
    end
  end
end
