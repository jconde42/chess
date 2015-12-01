class Pawn < Piece

  def special_hook(arg)
    # Check for promotion
    if @team == "white" && @position[1] == 7
      @special = "promotion"
    elsif @team == "black" && @position[1] == 0
      @special = "promotion"
    end
  end

  def set_attacking_moves(board)
    x = @position[0]
    y = @position[1]
    if team == "white"

      possible_attacking = [
        [x-1,y+1],
        [x+1,y+1]
      ]
    else
      possible_attacking = [
        [x-1,y-1],
        [x+1,y-1]
      ]
    end

    @attacking_moves = []
    possible_attacking.each do |move|
      if valid_coordinate?(move)
        @attacking_moves.push(move)
      end
    end
  end

  def set_moves(board)
    x = @position[0]
    y = @position[1]
    @moves = []

    if @team == "white"
      # front is empty
      if board.arr[x][y+1].nil? && valid_coordinate?([x,y+1])
        @moves.push([x,y+1])
      end

      # move two on first move
      if board.arr[x][y+2].nil? && !moved? && valid_coordinate?([x,y+2])
        @moves.push([x,y+2])
      end

      # takeing a piece on the left diagonal
      if valid_coordinate?([x-1,y+1])
        piece = board.find([x-1,y+1])
        if piece.nil?
          # do nothing
        else
          if piece.team != @team
            @moves.push([x-1,y+1])
          end
        end
      end

      # taking a piece on the right diagonal
      if valid_coordinate?([x+1,y+1])
        piece = board.find([x+1,y+1])
        if piece.nil?
          # do nothing
        else
          if piece.team != @team
            @moves.push([x+1,y+1])
          end
        end
      end

      # team == "black"
    else
      # front is empty
      if board.arr[x][y-1].nil? && valid_coordinate?([x,y-1])
        @moves.push([x,y-1])
      end

      # move two on first move
      if board.arr[x][y-2].nil? && !moved? && valid_coordinate?([x,y-2])
        @moves.push([x,y-2])
      end

      # takeing a piece on the left diagonal
      if valid_coordinate?([x+1,y-1])
        piece = board.find([x+1,y-1])
        if piece.nil?
          # do nothing
        else
          if piece.team != @team
            @moves.push([x+1,y-1])
          end
        end
      end

      # taking a piece on the right diagonal
      if valid_coordinate?([x-1,y-1])
        piece = board.find([x-1,y-1])
        if piece.nil?
          # do nothing
        else
          if piece.team != @team
            @moves.push([x-1,y-1])
          end
        end
      end
    end

    @moves
  end

  private
  def set_unicode
    if team == "white"
      @show = "\u265f"
    else
      @show = "\u2659"
    end
  end
end
