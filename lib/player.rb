class Player
	attr_accessor :player_name
	attr_accessor :player_games_win
	attr_accessor :player_games_loose
	attr_accessor :player_games_tie
	attr_accessor :player_symbol_game

	def initialize(name, symbol)
		@player_name = name
		@player_games_win = 0
		@player_games_loose = 0
		@player_games_tie = 0
		@player_games_symbol = symbol
	end

	

end