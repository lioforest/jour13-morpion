class Board

#	attr_accessor :board_name
	@board_case_list_statut =[]
	$win_type = ""
	def initialize
		@board_case_initial_list = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]

#		@board_case_initial_list.each do |case_adress|
#			variable_name = "@board_case_#{case_adress}"
#			variable_name = Board_Case.new("#{case_adress}") 
    	@A1 = Board_Case.new("A1")
	    @A2 = Board_Case.new("A2")
	    @A3 = Board_Case.new("A3")
	    @B1 = Board_Case.new("B1")
	    @B2 = Board_Case.new("B2")
	    @B3 = Board_Case.new("B3")
	    @C1 = Board_Case.new("C1")
	    @C2 = Board_Case.new("C2")
	    @C3 = Board_Case.new("C3")
	end

	def play_turn #méthode qui demande la case à jouer au joueur

   	   	show = Show.new
		show.show_board(@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3)

		counter_turn =1
		player_number =1
		win_tag = 0
		#Dans cette boucle, je lance la demande pendant 9 tours
		while counter_turn <10  
			turn_test = 0
			player_choice = ""
			 
			#dans cette boucle je teste que la case choisi soit bien dans le tableau
			while test_of_value_entered(player_choice) == 0 
					puts "=> Joueur #{player_number} : Quelle case choisis-tu ? "		
					#je mets ce if pour éviter d'avoir la phrase au 1er tour   
					if turn_test > 0 then 
						puts "Merci de saisir une des valeurs suivantes : A1,A2,A3,B1,B2,B3,C1,C2,C3"
					else
						turn_test+=1
					end
				print "Tour #{counter_turn}>"
				player_choice = gets.chomp.capitalize
			end
				#tant que la case choisie est déjà occupée, on demande une autre case.
				while get_board_case(player_choice).content != "  "
					puts "La case choisie est déjà prise, petit malin... il faut que tu changes !"
					puts "Indique une case vide"
					print ">Tour #{counter_turn}>"
					player_choice = gets.chomp.capitalize
				end
					#on a validé que la case indiqué par le joueur est bonne et vide, on met le symbol du joueur dans la case en question
					change_content_board_case(player_choice,player_number)
		   	system "clear"
	   	   	show = Show.new
			show.show_board(@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3)

			#je verifie si il n'y a pas une combinaison gagnante dans la grille d'abord pour le jour 1 puis pour le joueur 2
		    #on passe la main à l'autre joueur
		    if player_number == 1 then
				if win_game("🔵") == true then
					win_tag = 1
					win_message("1",$win_type)
					puts "Il a gagné au bout de #{counter_turn} tours.\n"
					break
				end
		    	player_number = 2
		    else
				if win_game("❌") == true then
					win_tag = 1
					win_message("2",$win_type)
					puts "Il a gagné au bout de #{counter_turn} tours.\n"
					break
				end
		    	player_number = 1
		    end
	
		    counter_turn+=1


		end

		if win_tag == 0 then
			tie_message			
		end

	end

	def test_of_value_entered(player_choice) #méthode qui vérifie que la valeur entrée par le joueur est valable
		if @board_case_initial_list.index(player_choice)
			return 1
		else	
			return 0
		end

	end

	def change_content_board_case (player_choice2,player_number2)
		if player_number2 == 1 then
		    get_board_case(player_choice2).content = "🔵"
	    else
		    get_board_case(player_choice2).content = "❌"
	    end

	end

	def get_board_case(player_choice)
	     return @A1 if player_choice == "A1"
	     return @A2 if player_choice == "A2"
	     return @A3 if player_choice == "A3"
	     return @B1 if player_choice == "B1"
	     return @B2 if player_choice == "B2"
	     return @B3 if player_choice == "B3"
	     return @C1 if player_choice == "C1"
	     return @C2 if player_choice == "C2"
	     return @C3 if player_choice == "C3"
	end

	def win_message(player_number3,win_type2)
					puts ""
					puts ""
					puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
					puts "🏆                                              🏆"
					puts "🏆            Le joueur #{player_number3} a gagné !             🏆"
					puts "🏆                                              🏆"
					puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
					puts ""
					puts ""
					puts "Il a gagné par une ligne #{win_type2}."
					puts ""
					puts ""
	end

	def tie_message
					puts ""
					puts ""
					puts "🎗️----------------------------------------------🎗️"
					puts "🎗️                                              🎗️"
					puts "🎗️           EGALITE - PERSONNE GAGNE           🎗️"
					puts "🎗️                                              🎗️"
					puts "🎗️----------------------------------------------🎗️"
					puts ""
					puts ""

	end

	def win_game(symbol)

		if @A1.content == symbol && @A2.content == symbol && @A3.content == symbol then
			$win_type = "Verticale"	
			return true

		elsif @B1.content == symbol && @B2.content == symbol && @B3.content == symbol then
			$win_type = "Verticale"	
			return true
		elsif @C1.content == symbol && @C2.content == symbol && @C3.content == symbol then
			$win_type = "Verticale"	
			return true
		elsif @A1.content == symbol && @B1.content == symbol && @C1.content == symbol then
			$win_type = "Horizontale"	
			return true
		elsif @A2.content == symbol && @B2.content == symbol && @C2.content == symbol then
			$win_type = "Horizontale"	
			return true
		elsif @A3.content == symbol && @B3.content == symbol && @C3.content == symbol then
			$win_type = "Horizontale"	
			return true
		elsif @A1.content == symbol && @B2.content == symbol && @C3.content == symbol then
			$win_type = "Diagonale"	
			return true
		elsif @A3.content == symbol && @B2.content == symbol && @C1.content == symbol then
			$win_type = "Diagonale"	
			return true
		end			

	end

end