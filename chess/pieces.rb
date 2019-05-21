class Piece
  attr_accessor :position
  attr_reader :color, :board
  def initialize( board, color = 'green' ) # position)
    @board = board
    @color = color

    @position = update_pos 
  
  end

  def update_pos 
    board.rows.each_with_index do |row, y|
      row.each_with_index do |space, x|
        if space == self
          @position = [x,y]
        end
      end
    end
    position
  end




  def inspect
    if color == "green"
    "<#{type}>".green
    else
    "<#{type}>".light_blue
    end
    
  end

  def null?
    return false
  end

end


class NullPiece < Piece
  # def initialize
  # end

  def inspect
    "<null>".light_black
  end

  def null?
    true
  end


end

class Rook < Piece
  # def inspect
  #   "<ROOK>".green
  # end
  def type
    "ROOK"
  end
end

class Bishop < Piece
  def type
    "BISH"
  end
end

class Knight < Piece
  def type
    "KNGT"
  end
end

class Queen < Piece
  def type
    "QWEN"
  end
end

class King < Piece
  def type
    "KANG"
  end
end

class Pawn < Piece
  def type
    "PAWN"
  end
end


