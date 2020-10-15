require './lib/board'
require './lib/game'
require './lib/show'
require './lib/player'
require './lib/boardcase'


game=Game.new
board=Board.new
show=Show.new


while game.status == "ongoing"
	game.turn(board, show, game)
end




