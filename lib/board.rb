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
 
  def play_turn(game)

  	puts "A #{game.current_player.name} de jouer !"
  	puts "Sur quelle case souhaitez-vous déposer un pion ?"
    print "> "

  	case_choice = gets.chomp.to_s

	@boardcase_array.each do |boardcase|
		if boardcase.id == case_choice
			boardcase.value = game.current_player.value
		  puts boardcase.value
    end
	end
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  end

  def victory?(game)
  	
  	winning_combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  	winning_combinations.each do |winning_array|
  		a=winning_array[0]
  		b=winning_array[1]
  		c=winning_array[2]
   		if @boardcase_array[a].value == @boardcase_array[b].value and @boardcase_array[b].value == @boardcase_array[c].value and @boardcase_array[c].value == game.current_player.value

        return true
  		end
      end
      return false
  

    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end

  def wipe_clean
  @boardcase_array = []
    case_id_array = ["a1","b1","c1","a2","b2","c2","a3","b3","c3"]
    case_id_array.each do |id|
      new_case=BoardCase.new(id)
      @boardcase_array.push(new_case)
    end
  end

end
