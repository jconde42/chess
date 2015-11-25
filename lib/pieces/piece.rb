class Piece
  attr_reader :position, :team, :show, :possible_moves

  def initialize(arg)
    if valid_coordinate?(arg[:position])
      @position = arg[:position]
      @team = arg[:team]
      set_unicode
    end

    @moved = false
  end

  def move(arg)
    target = arg[:target]
    board = arg[:board]
    set_moves(board)

    if @possible_moves.include?(target)
      @position = target
      @moved = true
      return board.move(mover: self,target: target)
    else
      return false
    end
  end

  def moved?
    @moved
  end

  private

  def set_moves(board)
    raise(NotImplementedError, "#{self.class} needs to implement set_moves")
  end

  def set_unicode
    @show = "set_unicode"
  end

  def valid_coordinate?(arr)
    x = arr[0]
    y = arr[1]

    if x < 0 or x > 7 or y < 0 or y > 7
      return false
    else
      return true
    end
  end

end
