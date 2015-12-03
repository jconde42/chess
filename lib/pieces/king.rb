class King < Piece
  def special_hook(arg)
    target_position = arg[:target_position]
    old_position = arg[:old_position]
    x = old_position[0]
    y = old_position[1]

    if target_position == [x-2,y] or target_position == [x+2,y]
      @special = "castle"
    end
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

    if !moved?
      #left castle hasn't moved
      if !board.arr[0][y].moved?
        # No pieces between king and rook
        if board.arr[1][y].nil? && board.arr[2][y].nil? && board.arr[3][y].nil?
          #king not in check
          if board.clear?(team: @team, arr: @position)
            #squares inbetween or destination is not being attacked
            if board.clear?(team: @team, arr: [2,y]) &&\
                board.clear?(team: @team, arr: [3,y])
              @moves.push([x-2,y])
            end
          end
        end
      end

      #right castle hasn't moved
      if !board.arr[7][y].moved?
        # No pieces between king and rook
        if board.arr[6][y].nil? && board.arr[5][y].nil?
          #king not in check
          if board.clear?(team: @team, arr: @position)
            #squares inbetween or destination is not being attacked
            if board.clear?(team: @team, arr: [5,y]) &&\
                board.clear?(team: @team, arr: [6,y])
              @moves.push([x+2,y])
            end
          end
        end
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
