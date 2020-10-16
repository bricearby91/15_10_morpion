class Game
  attr_accessor :current_player, :status, :number_of_turns, :players_array


#(en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  def initialize
    puts "Prénom du joueur numéro 1 :"
    print "> "
    player1_name=gets.chomp.to_s

    puts "Prénom du joueur numéro 2 :"
    print "> "
    player2_name=gets.chomp.to_s

    player1=Player.new(player1_name, "X")
    player2=Player.new(player2_name, "O")
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @players_array=[]
    @players_array.push(player1)
    @players_array.push(player2)
    @number_of_turns = 0

    @current_player = ""

    @status = "ongoing"
  end

  def turn(board, show, game)
    
    @current_player = @players_array[@number_of_turns % 2]



    #TO DO : méthode faisant appel aux méthodes des autres classes (notamment à l'instance de Board). 
    #Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, 
    #passe au joueur suivant si la partie n'est pas finie.
    
    board.play_turn(game)

    show.show_board(board)

    @number_of_turns += 1

    puts ""
    if board.victory?(game)
      puts "#{current_player.name} remporte ce match ! Bravo à lui !"
      game_end(board)
      
    elsif @number_of_turns == 9
      puts "Match nul ! La partie est terminée et aucun de vous deux ne l'a emporté.."
      game_end(board)

    end
  end

  def new_round(board)
    
    @number_of_turns = 0

    board.wipe_clean
    puts ""
    puts "Allez, c'est reparti pour un tour !"
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end(board)

   reponse = ""
    while reponse != "claire"
    puts "La partie est terminée. Souhaitez-vous recommencer ? (o/n)"
    
    choice = gets.chomp.to_s

    if choice == "o" || choice == "O" || choice == "0"
      reponse="claire"
      new_round(board)
      
    elsif choice == "n" || choice == "N"
      reponse = "claire"
      puts "A plus ! N'hésitez pas à revenir jouer !"
      @status = "over"
    else
      puts "Votre réponse n'a pas été comprise."
  
    end

    end

  end    


end


