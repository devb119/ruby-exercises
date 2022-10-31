require_relative 'board.rb'
require_relative 'game.rb'
require_relative 'player.rb'

game = Game.new
while 1
    game.play
    puts "Do you wanna play again? (y/n)"
    option = gets.chomp.downcase
    if option == 'y'
    else break
    end
end