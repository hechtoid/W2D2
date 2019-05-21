require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'
class Display
  attr_accessor :board, :cursor
  
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0],board)
  end

  def render
    board.rows.each_with_index do |row, x|
      rendered_row = row.map.with_index do |space, y|
        if [x,y] == cursor.cursor_pos
          space.inspect.on_white
        elsif [x,y] == cursor.selected_pos
          space.inspect.on_yellow
        else
          space.inspect 
        end
      end 
      puts rendered_row.join("  ")
      puts
    end
    return true
  end



end

d = Display.new
# d.board[0,0] = Pawn.new
# d.board[0,1] = Pawn.new
while true
d.render
d.cursor.get_input
#system("clear")
end
