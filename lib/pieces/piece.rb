class Piece
  attr_reader :position, :team, :show, :moves, :special, :attacking_moves

  def initialize(arg)
    if valid_coordinate?(arg[:position])
      @position = arg[:position]
      @team = arg[:team]
      set_unicode
    end

    @moved = false
    @special = false
    @moves = []
  end

  def move(arg)
    @moves = []
    target_position = arg[:target_position]
    board = arg[:board]
    set_moves(board)
    p @moves
    gets

    if @moves.include?(target_position)
      old_position = @position
      @position = target_position

      special_hook(arg.merge(old_position: old_position))

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

  def set_moves(board)
    raise(NotImplementedError, "#{self.class} needs to implement set_moves")
  end

  def set_attacking_moves(board)
    set_moves(board)
    @attacking_moves = @moves
  end

  private

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
