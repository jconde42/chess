require_relative "./board"
require_relative "pieces/piece"
require_relative "pieces/king"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/bishop"
require_relative "pieces/knight"
require_relative "pieces/pawn"

def play
  board = Board.new
  turn = "white"

  while true #no winner
    system("cls") or system("clear")
    board.display
    puts " It is #{turn}'s turn"
    inputs = get_inputs

    if inputs
      target_position = inputs[:target_position] 
      piece = board.find(inputs[:piece_position])

      # selected a black space to move?
      if piece.nil?
        puts "There is no piece at that position (Press Enter)"
        gets
        next
      end

      # selected the other teams piece?
      #   if piece.team != turn
      #     puts "That's not your piece (Press Enter)"
      #     gets
      #     next
      #   end

      pre_move_position = piece.position

      if piece.move(target_position: target_position, board: board)
        board.move(piece_pre_position: pre_move_position,
                   piece_post: piece,
                   special: piece.special)
        turn = change_turn(turn)
      end
    else
      puts "That not a valid move (Press Enter)"
      gets
    end

  end
end


def get_inputs
  puts "Enter a move: (mover, target)"
  raw = gets.chomp
  mover = numerate(raw[/^../])
  target = numerate(raw[/..$/])

  if !valid_coordinate?(mover) || !valid_coordinate?(target)
    return false
  else
    return { piece_position: mover, target_position: target }
  end
end

def change_turn(string)
  if string == "white"
    return "black"
  else
    return "white"
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

def numerate string
  arr = []
  arr[0] = [string.chr.bytes[0]-49].pack('c*').to_i
  arr[1] = string[1].to_i-1
  arr
end
