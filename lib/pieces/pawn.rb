class Pawn < Piece

  def special_hook(arg)
    board = arg[:board]
    old_position = arg[:old_position]
    old_y = old_position[1]
    old_x = old_position[0]

    new_y = @position[1]
    new_x = @position[0]

    # Check for promotion
    if @team == "white" && new_y == 7
      @special = "promotion"
      return
    elsif @team == "black" && new_y == 0
      @special = "promotion"
      return
    end

    # check for en passant
    if @team == "white"
      if new_y - old_y == 2
        @special = "en passant"
        return
      end
    elsif @team == "black"
      if new_y - old_y == -2
        @special = "en passant"
        return
      end
    end

    #check that the piece is taking an enpassant
    if @team == "white"
      if old_y == 4
        #left
        if !board.arr[old_x-1][old_y].nil? && board.arr[old_x-1][old_y].special == "en passant"
          if old_x - new_x == 1 && new_y - old_y == 1
            @special = "attacking en passant"
            return
          end
        end
        #right
        if !board.arr[old_x+1][old_y].nil? && board.arr[old_x+1][old_y].special == "en passant"
          if new_x - old_x == 1 && new_y - old_y == 1
            @special = "attacking en passant"
            return
          end
        end

      end
    elsif @team == "black"
      if old_y == 3
        #left
        if !board.arr[old_x-1][old_y].nil? && board.arr[old_x-1][old_y].special == "en passant"
          if old_x - new_x == 1 && old_y - new_y == 1
            @special = "attacking en passant"
            return
          end
        end
        #right
        if !board.arr[old_x+1][old_y].nil? && board.arr[old_x+1][old_y].special == "en passant"
          if new_x - old_x == 1 && old_y - new_y == 1
            @special = "attacking en passant"
            return
          end
        end

      end
    end

    @special = false
  end

  def set_special(string)
    @special = string
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

      if y == 4
        #check left and right for en passant pawn
        if !board.arr[x-1][y].nil? && board.arr[x-1][y].special == "en passant"
          @moves.push([x-1,y+1])
        end

        if !board.arr[x+1][y].nil? && board.arr[x+1][y].special == "en passant"
          @moves.push([x+1,y+1])
        end

      end

      # team == "black"
    elsif @team == "black"
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

      #en passant
      if y == 3
        #check left and right for en passant pawn
        if !board.arr[x-1][y].nil? && board.arr[x-1][y].special == "en passant"
          @moves.push([x-1,y-1])
        end

        if !board.arr[x+1][y].nil? && board.arr[x+1][y].special == "en passant"
          @moves.push([x+1,y-1])
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
