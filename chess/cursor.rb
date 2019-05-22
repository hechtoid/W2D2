require "io/console"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board
  attr_accessor :selected_pos

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @selected_pos = nil
  end
  
  def get_input
    begin
    key = KEYMAP[read_char]
    handle_key(key)
    rescue NoPieceError
      @selected_pos = nil
      retry
    end
  end
  
  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                         
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    if MOVES.has_key?(key)
      move(key)
    end
    if key == :ctrl_c
      raise ChessOverError, "CHESS TIME IS OVER!"
    end

    if key == :return && selected_pos.nil?
      @selected_pos = cursor_pos.dup
      @board[*selected_pos].validate_pos
    elsif key == :return && !selected_pos.nil?
      board.move_piece(selected_pos, cursor_pos.dup)
      @selected_pos = nil
     
    end

  end
  
  def move(key)
    new_x = cursor_pos[0] + MOVES[key][0]
    new_y = cursor_pos[1] + MOVES[key][1]
    if new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7  
      cursor_pos[0] += MOVES[key][0]
      cursor_pos[1] += MOVES[key][1]
    else
      get_input
    end
  end

  def update_pos(diff)
  end
end

class ChessOverError < StandardError; end