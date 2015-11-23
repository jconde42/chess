class Piece
  attr_reader :position, :team, :show

  def initialize(arg)
    if valid_coordinate?(arg[:position])
      @position = arg[:position]
      @team = arg[:team]
      set_unicode
    end
  end

  def move(arg)
    raise(NotImplementedError, "#{self.class} needs to implement move")
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

  def set_position(arr) # for debugging
    @position = arr
  end
end
