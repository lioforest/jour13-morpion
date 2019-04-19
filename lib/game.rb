class Game

	attr_accessor :game_name
	attr_accessor :game_number


	def initialize(enter_game_name)
		@game_name = enter_game_name
		@game_number = 0
		system "clear"
		puts "-" * 30
		puts "Bienvenue dans le jeu du Morpion !"
		puts "-" * 30
		puts "\n---------------"
		puts "Joueur 1 - Tape ton pseudo (ton pion sera le 🔵) ?"
		print ">"
			player_1_enter = gets.chomp
			player_1 = Player.new(player_1_enter,"🔵")
		puts "\n---------------"
		puts "Joueur 2 - Tape ton pseudo (ton pion sera le ❌) ?"
		print ">"
			player_2_enter = gets.chomp
			player_2 = Player.new(player_2_enter,"❌")
		
		puts "\n"
		
    puts "la partie va commencée"
    puts "tape entrée pour y aller "
    gets.chomp
    system "clear"
    
	Board.new.play_turn

	end



end