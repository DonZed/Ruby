class Game
  require './lib/board.rb'
  require './lib/player.rb'
  attr_accessor :active_player, :other_player, :board
  
  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def initialize(player1, player2)
  	@board = Board.new
  	@active_player = Player.new(player1, "X")
  	@other_player = Player.new(player2, "O")
  end

  def switch_player
    @active_player, @other_player = @other_player, @active_player
  end

  def win?
    LINES.any? do |line|
      line.all? do |x|
        board.board[x] == active_player.sign
      end
    end
  end

  def play
    9.times do 
      board.show_board

      puts "\n#{active_player.name} select #{active_player.sign} position"
      
      @position = gets.chomp.to_i - 1
      
      if board.board[@position].class == Fixnum
        board.board[@position] = active_player.sign
      else
        puts "Position already taken"
        redo
      end
      
      @win = win?
      break if @win 
      switch_player
    end
    puts @win ? "#{active_player.name} wins!" : "It's a draw!"
    board.show_board
  end

end


x = Game.new("Zed", "Jack")
x.play

