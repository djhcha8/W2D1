require_relative "piece"

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    
    @grid.size.times do |row|
      @grid.size.times do |col|
        @grid[row][col] = Piece.new if row < 2 || row > 5
      end
    end
  end
  
  def [](pos)
    row = pos.first
    col = pos.last
    @grid[row][col]
  end
  
  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end
  
  def move_piece(start_pos, end_pos)
    if in_bounds?(start_pos) || in_bounds?(end_pos)
      raise "Invalid move. Position is outside of the board"
    elsif self[start_pos].nil?
      raise "Invalid move. There isn't a piece on your starting position."
    elsif !self[end_pos].nil?
      raise "Invalid move. There is a piece already there."
    end
    
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end
  
  def in_bounds?(pos)
    pos.any? { |num| num > 7 || num < 0 }    
  end
  
  
end