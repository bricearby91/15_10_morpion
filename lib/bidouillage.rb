require 'pry'

class BoardCase
  attr_accessor :value, :id

  
  def initialize(id)
	@value = " "
	@id = id   #TO DO : doit régler sa valeur, ainsi que son numéro de case
  end
  
end


class Board

  attr_accessor :boardcase_array
  def initialize
  	@boardcase_array = []
  	case_id_array = ["a1","b1","c1","a2","b2","c2","a3","b3","c3"]
  	case_id_array.each do |id|
  		new_case=BoardCase.new(id)
  		@boardcase_array.push(new_case)
  	end
  end
#TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
end



class Show

def show_board(board)
	
puts board.class
hash=Hash.new

board.boardcase_array.each do |boardcase|
	hash[boardcase.id] = boardcase.value
end

	for i in ["a","b","c"]
		puts "-" * 32
			3.times do
				print "|" + " " * 9
				end
				puts "|"
			for j in ["1","2","3"]
					print "|" + " " * 4 + hash[i+j] + " " * 4
			end
			puts "|"
			3.times do
				print "|" + " " * 9
					end
			puts "|"
	end
	puts "-" * 32


end
end

board=Board.new
show=Show.new
show.show_board(board)
