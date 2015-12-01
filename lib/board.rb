class Board
  attr_reader :arr

  def initialize
    @arr = Array.new(8) { Array.new(8,nil)  }
    populate_arr
  end

  def all_pieces
    all_pieces = []

    @arr.each_with_index do |row|
      row.each do |piece|
        if !piece.nil?
          all_pieces.push(piece)
        end
      end
    end

    all_pieces
  end

  def all_white_pieces
    white_pieces = []
    all_pieces.each do |piece|
      if piece.team == "white"
        white_pieces.push(piece)
      end
    end

    white_pieces
  end

  def all_black_pieces
    black_pieces = []
    all_pieces.each do |piece|
      if piece.team == "black"
        black_pieces.push(piece)
      end
    end

    black_pieces
  end

  def find(arr)
    if valid_coordinate?(arr)
      return @arr[arr[0]][arr[1]]
    else
      return false
    end
  end

  def display
    puts "---------CHESS---------"
    puts

    puts "    a| b| c| d| e| f| g| h"

    [7,6,5,4,3,2,1,0].each do |row|
      print "#{row+1} |"
      (0..7).each do |column|
        if arr[column][row].nil?
          print " .|"
        else
          print "#{arr[column][row].show} |"
        end
      end
      puts
    end
    puts "    a| b| c| d| e| f| g| h"
    puts
  end

  def move(arg)
    piece_post = arg[:piece_post]
    piece_pre_position = arg[:piece_pre_position]
    special = arg[:special]

    case special
    when "castle"
    when "en passent"
    when "promotion"
      if piece_post.team == "white"
        @arr[piece_post.position[0]][piece_post.position[1]] = \
          Queen.new(position: piece_post.position, team: "white")
        @arr[piece_pre_position[0]][piece_pre_position[1]] = nil
        return true
      else
        @arr[piece_post.position[0]][piece_post.position[1]] = \
          Queen.new(position: piece_post.position, team: "black")
        @arr[piece_pre_position[0]][piece_pre_position[1]] = nil
        return true
      end
    end

    # Move to space
    if valid_coordinate?(piece_post.position) &&\
        @arr[piece_pre_position[0]][piece_pre_position[1]]
      @arr[piece_post.position[0]][piece_post.position[1]] = piece_post
      @arr[piece_pre_position[0]][piece_pre_position[1]] = nil
      return true
    else
      return false
    end
  end

  private
  def populate_arr(empty = false)
    #White Pieces
    if !empty
      @arr[0][0] = Rook.new( position: [0,0], team: "white")
      @arr[1][0] = Knight.new( position: [1,0], team: "white")
      @arr[2][0] = Bishop.new( position: [2,0], team: "white")
      @arr[3][0] = Queen.new( position: [3,0], team: "white")
      @arr[4][0] = King.new( position: [4,0], team: "white")
      @arr[5][0] = Bishop.new( position: [5,0], team: "white")
      @arr[6][0] = Knight.new( position: [6,0], team: "white")
      @arr[7][0] = Rook.new( position: [7,0], team: "white")

      (0..7).each do |column|
        @arr[column][1] = Pawn.new( position: [column, 1], team: "white")
      end

      #Black Pieces
      @arr[0][7] = Rook.new( position: [0,7], team: "black")
      @arr[1][7] = Knight.new( position: [1,7], team: "black")
      @arr[2][7] = Bishop.new( position: [2,7], team: "black")
      @arr[3][7] = Queen.new( position: [3,7], team: "black")
      @arr[4][7] = King.new( position: [4,7], team: "black")
      @arr[5][7] = Bishop.new( position: [5,7], team: "black")
      @arr[6][7] = Knight.new( position: [6,7], team: "black")
      @arr[7][7] = Rook.new( position: [7,7], team: "black")

      (0..7).each do |column|
        @arr[column][6] = Pawn.new( position: [column, 6], team: "black")
      end
    end
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
