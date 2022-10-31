require_relative 'player.rb'
require_relative 'board.rb'

class Game
    @@winner = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]]
    def initialize
        @current_player = 0
    end

    def display_board
        @board.display
    end

    def check_winner
        @@winner.each do |arr|
            if (@board.board[arr[0]] == @board.board[arr[1]] &&
                @board.board[arr[1]] == @board.board[arr[2]] &&
                @board.board[arr[0]] == @board.board[arr[2]])
                return @board.board[arr[0]] if @board.board[arr[0]] != " "
            end
        end
        if @board.board.select{|cell| cell != ' '}.length == 9
            return 0
        end
        return nil
    end

    def add_symbol
        current = @current_player % 2 == 0 ? @player1 : @player2
        puts "Turn: #{current.name} (#{current.symbol})\nPlease input position:"
        position = gets.chomp.to_i
        add_success = @board.add_symbol(current.symbol, position)
        if add_success
            @current_player += 1
        end
    end

    def play
        puts "Enter player 1 name:"
        player1_name = gets.chomp
        puts "Enter player 2 name:"
        player2_name = gets.chomp
        @player1 = Player.new(player1_name, 'X')
        @player2 = Player.new(player2_name, 'O')
        @board = Board.new
        # p check_winner
        display_board
        while 1 do
            # Game end
            if (check_winner != nil)
                if check_winner == 0
                    puts "Game draw"
                else
                    puts "The winner is #{check_winner}"
                end
                break
            end
            add_symbol
            display_board
        end
    end
end