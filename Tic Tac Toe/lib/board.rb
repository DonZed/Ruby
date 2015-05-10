class Board
    attr_accessor :board

    def initialize
      @board = new_board
    end

    def new_board
  	  Array (1..9)
    end

    def show_board
  	  @board.each_with_index do |number, index| 
  	    print number
        print " | " unless index.to_s =~ /[258]/
  	    print "\n--+---+--\n" if index.to_s =~ /[25]/
  	  end
    end
  end