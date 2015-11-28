class Piece
  attr_reader :position, :team, :show, :moves, :special

  def initialize(arg)
    if valid_coordinate?(arg[:position])
      @position = arg[:position]
      @team = arg[:team]
      set_unicode
    end

    @moved = false
    @special = false
  end

  def move(arg)
    target_position = arg[:target_position]
    board = arg[:board]
    set_moves(board)

    if @moves.include?(target_position)
      @position = target_position

      special_hook(arg)

      @moved = true
      return true
    end

    return false
  end

  def special_hook(arg)
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
