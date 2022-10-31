class Board
    @@horizontal_bar = "|-----|-----|-----|"
    attr_accessor :board

    def initialize(board = Array.new(9, ' '))
        @board = board
    end

    def display
        puts @@horizontal_bar
        puts "|  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  |"
        puts @@horizontal_bar
        puts "|  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |"
        puts @@horizontal_bar
        puts "|  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  |"
        puts @@horizontal_bar
    end

    def add_symbol(symbol, position)
        if position > 8 || position < 0
            puts "Invalid position!"
            return false
        end
        if @board[position] != ' '
            puts "Position #{position} have already been marked #{@board[position]}"
            return false
        else
            @board[position] = symbol
            return true
        end
    end
end