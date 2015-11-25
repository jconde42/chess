require "board"
require "pieces/piece"
require "pieces/king"
require "pieces/queen"
require "pieces/rook"
require "pieces/bishop"
require "pieces/knight"
require "pieces/pawn"

def play
  board = Board.new

  while true #no winner
    system("cls") or system("clear")
    board.display
    puts "Enter a move: (mover, target)"
    raw = gets.chomp
    mover = raw.split(", ")[0]
    target = raw.split(", ")[1]

    moving_piece = board.find(numerate(mover))
    board = moving_piece.move(target: numerate(target), board: board)
  end
end


def numerate string
  arr = []
  arr[0] = [string.chr.bytes[0]-49].pack('c*').to_i
  arr[1] = string[1].to_i-1

  return arr
end
