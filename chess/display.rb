require "colorize"
require_relative "cursor"
require_relative "board"

class Display

  def initialize(board)
      @cursor = Cursor.new([0,0], board)
  end

  def show
    @cursor
  end
end