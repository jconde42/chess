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

      not_being_attacked = clear?(arr: move, board: board)

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

  #checks that a position is not being attacked by the other team
  def clear?(arg)
    arr = arg[:arr]
    board = arg[:board]

    if @team == "white"
      board.all_black_pieces.each do |piece|
        piece.set_attacking_moves(board)
        if piece.attacking_moves.include?(arr)
          return false
        end
      end
    end

    if @team == "black"
      board.all_white_pieces.each do |piece|
        piece.set_attacking_moves(board)
        if piece.attacking_moves.include?(arr)
          return false
        end
      end
    end

    true
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
