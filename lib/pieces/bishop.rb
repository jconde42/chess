class Bishop < Piece

  def set_moves(board)
    x = @position[0]
    y = @position[1]

    # positive right
    (1..7).each do |i|
      if !valid_coordinate?([x+i, y+i])
        break
      end

      if board.arr[x+i][y+i].nil?
        @moves.push([x+i, y+i])
        next
      end

      if board.arr[x+i][y+i].team != @team
        @moves.push([x+i, y+i])
        break
      end

      if board.arr[x+i][y+i].team == @team
        break
      end
    end

    # negative right
    (1..7).each do |i|
      if !valid_coordinate?([x+i, y-i])
        break
      end

      if board.arr[x+i][y-i].nil?
        @moves.push([x+i, y-i])
        next
      end

      if board.arr[x+i][y-i].team != @team
        @moves.push([x+i, y-i])
        break
      end

      if board.arr[x+i][y-i].team == @team
        break
      end
    end

    # positive left
    (1..7).each do |i|
      if !valid_coordinate?([x-i, y+i])
        break
      end
      
      if board.arr[x-i][y+i].nil?
        @moves.push([x-i, y+i])
        next
      end

      if board.arr[x-i][y+i].team != @team
        @moves.push([x-i, y+i])
        break
      end
      
      if board.arr[x-i][y+i].team == @team
        break
      end
    end

    # negative left
    (1..7).each do |i|
      if !valid_coordinate?([x-i, y-i])
        break
      end

      if board.arr[x-i][y-i].nil?
        @moves.push([x-i, y-i])
        next
      end

      if board.arr[x-i][y-i].team != @team
        @moves.push([x-i, y-i])
        break
      end

      if board.arr[x-i][y-i].team == @team
        break
      end
    end
  end

  private
  def set_unicode
    if team == "white"
      @show = "\u265d"
    else
      @show = "\u2657"
    end
  end
end
