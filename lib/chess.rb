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

    # board.move(mover: board.find(inputs[:mover_position]),\
    #          target_position: inputs[:target_position])

    # mover = board.find(inputs[:mover_position])
    # target_position = inputs[:target_position]

    # board.move(mover: mover, target_position: target_position)

    target_position = inputs[:target_position] 
    piece = board.find(inputs[:piece_position])
    pre_move_position = piece.position

    if piece.move(target_position: target_position, board: board.clone)
      board.move(piece_pre_position: pre_move_position, \
                 target_position: target_position, \
                 piece_post: piece)
    end

  end
end


def get_inputs
  puts "Enter a move: (mover, target)"
  raw = gets.chomp
  mover = raw.split(", ")[0]
  target = raw.split(", ")[1]

  return { piece_position: numerate(mover), target_position: numerate(target) }
end

def change_turn string
  if string == "white"
    return "black"
  else
    return "white"
  end
end

def numerate string
  arr = []
  arr[0] = [string.chr.bytes[0]-49].pack('c*').to_i
  arr[1] = string[1].to_i-1
  arr
end
