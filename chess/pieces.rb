class Piece
  attr_accessor :position, :valid
  attr_reader :color, :board
  def initialize(board, color = 'green' ) # position)
    @board = board
    @color = color
    @position = update_pos 
    @valid = false
  
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

module Slideable
  def validate_pos
    valids=[]
    p self.update_pos 
    # x,y = @position.dup
   # p "x is #{x}"
    #p "y is #{y}"
    # until x==7
    #   x+=1
    #   valids << [x,y]
    # end
    # until x==0
    #   x-=1
    #   valids << [x,y]
    # end
    # until y==7
    #   y+=1
    #   valids << [x,y]
    # end
    # until y==0
    #   y-=1
    #   valids << [x,y]
    # end
    # valids.each { |pos| board[*pos].valid = true } 
    
  end
end

class NullPiece < Piece
  # def initialize
  # end
 include Slideable
  def inspect
    "<null>".light_black
  end

  def null?
    true
  end


end

class Rook < Piece
  include Slideable
  # def inspect
  #   "<ROOK>".green
  # end
  def type
    "ROOK"
  end
end

class Bishop < Piece
   include Slideable
  def type
    "BISH"
  end
end

class Knight < Piece
   include Slideable
  def type
    "KNGT"
  end
end

class Queen < Piece
   include Slideable
  def type
    "QUUN"
  end
end

class King < Piece
   include Slideable
  def type
    "KANG"
  end
end

class Pawn < Piece
   include Slideable
  def type
    "PAWN"
  end
end






