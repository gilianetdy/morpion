require 'bundler'
require 'espeak'
Bundler.require
require_relative 'lib/app/player'
require_relative 'lib/app/Board'
require_relative 'lib/app/board_case'
require_relative 'lib/app/game'
require_relative 'lib/views/show'



def intro
		# On affiche l'introduction du jeu
	puts "-------------------------------------------------"
	puts "|  Bienvenue sur 'LE MODAFUCKING MORPION' !      |"
	puts "-------------------------------------------------"

	# On demande l'utilisateur son prénom
	puts "Quel est ton prénom JOUEUR 1 ?"
	print ">"
	@player_1 = gets.chomp.to_s
	puts "Quel est ton prénom JOUEUR 2 ?"
	print ">"
	@player_2 = gets.chomp.to_s

end	

def wanna_play_for_eternity
	puts "tu veux jouer une autre partie ? Press Y or N"
	puts "> Y/N"
	ur_choice_mate = gets.chomp.to_s.upcase
	if ur_choice_mate == "Y"
		return perform_2
	else return "tant pis"
	end
end

def perform
	intro

	my_game = Game.new(@player_1, @player_2)
	while my_game.is_still_ongoing?
		my_game.board.show_board
		my_game.menu
	end
	my_game.game_over
	wanna_play_for_eternity
end

def perform_2
	my_game = Game.new(@player_1, @player_2)
	while my_game.is_still_ongoing?
		my_game.board.show_board
		my_game.menu
	end
	my_game.game_over
	wanna_play_for_eternity
end
perform
perform_2