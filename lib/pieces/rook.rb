class Rook < Piece

  private

  def set_moves(board)
    x = @position[0]
    y = @position[1]

    # moves up
    (y+1..7).each do |row|
      if !valid_coordinate?([x,row])
        break
      end

      if board.arr[x][row].nil?
        @moves.push([x,row])
        next
      end

      if board.arr[x][row].team != @team
        @moves.push([x,row])
        break
      end
    end

    # moves right
    (x+1..7).each do |column|
      if !valid_coordinate?([column,y])
        break
      end

      if board.arr[column][y].nil?
        @moves.push([column,y])
        next
      end

      if board.arr[column][y].team != @team
        @moves.push([column,y])
        break
      end
    end
    
    # moves down
    r = (y-1..0)
    (r.first).downto(r.last).each do |row|
      if !valid_coordinate?([x, row])
        break
      end

      if board.arr[x][row].nil?
        @moves.push([x,row])
        next
      end

      if board.arr[x][row].team != @team
        @moves.push([x,row])
        break
      end
    end
    
    # moves left
    r = (x-1..0)
    (r.first).downto(r.last).each do |column|
      if !valid_coordinate?([column, y])
        break
      end

      if board.arr[column][y].nil?
        @moves.push([column, y])
        next
      end

      if board.arr[column][y].team != @team
        @moves.push([column, y])
        break
      end
    end
   


  end

  def set_unicode
    if team == "white"
      @show = "\u265c"
    else
      @show = "\u2656"
    end
  end
end
