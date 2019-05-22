require_relative 'pieces.rb'

class Board
  attr_reader :rows
  def initialize 
    @rows = Array.new(8) do
      Array.new(8) { nil }
    end
   populate
  end

  def populate
   rows[0] = [ Rook.new(self, "blue"), Knight.new(self, "blue"), Bishop.new(self, "blue"), Queen.new(self, "blue"), King.new(self, "blue"), Bishop.new(self, "blue"), Knight.new(self, "blue"), Rook.new(self, "blue")]
    rows[1].map! { |space| Pawn.new(self, "blue") }
    rows[2].map! { |space| NullPiece.new(self) }
    rows[3].map! { |space| NullPiece.new(self) }
    rows[4].map! { |space| NullPiece.new(self) }
    rows[5].map! { |space| NullPiece.new(self) }
    rows[6].map! { |space| Pawn.new(self) }
   rows[7] = [Rook.new(self), Knight.new(self), Bishop.new(self), Queen.new(self), King.new(self), Bishop.new(self), Knight.new(self) ,Rook.new(self)]
  end

  def [](*pos)
    row, col = pos
    rows[row][col]
  end

  def []=(*pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def valid_pos?(*pos)
    row, col = pos
    rows[row][col] ? true : false
  end

  def move_piece(start_pos, end_pos)
    if self[*start_pos].null?
      raise NoPieceError, "No Piece There #{start_pos}"
    else
      piece = self[*start_pos]
      self[*end_pos] = piece
      self[*start_pos] = NullPiece.new(self)
    end
  end
end

class NoPieceError < StandardError; end