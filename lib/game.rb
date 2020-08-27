require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :token
  
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [2, 4, 6], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
     WIN_COMBINATIONS.detect do |win_combination|
      @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && @board.taken?(win_combination[0]) && (@board.cells[win_combination[0]] == "X" || @board.cells[win_combination[0]] =="O")
    end
  end
  
  def draw?
    if @board.full? && !self.won?
      true
    elsif self.won?
     false
    elsif !@board.full? && !self.won?
      false
    end
  end
  
  def over?
    self.draw? || self.won?  
  end
  
  def winner
    if winning_combo = won?
      winner = @board.cells[winning_combo.first]
    end
  end
  
  def turn
    binding.pry
    #player_1
    #@board.current_player
    puts "Please enter 1-9:"
    user_input = gets.strip
    input = @board.position(user_input)
    #player = current_player
    if @board.valid_move?(input)
      @board.update(input, player)
    else
      turn
    end
    @board.display_board
  end
  

  
end