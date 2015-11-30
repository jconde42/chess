class Queen < Piece

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
    end
  end
  
  def set_unicode
    if team == "white"
      @show = "\u265b"
    else
      @show = "\u2655"
    end
  end
end
