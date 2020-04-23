require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/box'
require_relative 'lib/board'

#Introduction
puts ""
puts "###########################################"
puts "Bienvenue dans le super morpion de Mathieu"
puts "###########################################"
puts ""
puts "Pour continuer, appuie sur > [ENTREE]"
puts gets.chomp
puts ""
puts "Voici les règles de ce magnifique morpion:"
puts ""
puts "1 - Ne pas insulter son adversaire"
puts "2 - Pour bouger les pions : définir la colonne (A,B,C) ainsi que la ligne (1,2,3)"
puts ""
puts "Exemple: pour jouer la case du milieu, definir 'B2'"
puts ""
puts "  1 2 3"
puts "A| | | |"
puts "B| | | |"
puts "C| | | |"
puts ""
puts "Tout compris? Pour commencer une partie, appuie sur > [ENTREE]"
puts gets.chomp


game1 = Game.new
    puts game1.game_round

match = true

while match == true
    puts "Voulez-vous rejouer [OUI/NON]?"
    puts "1 : Oui"
    puts "2 : Non"

    yes_or_no = gets.chomp
    if yes_or_no == "1"
        puts""
        puts "C'est parti!"
        puts ""
        game1 = Game.new
            puts game1.game_round
        match = true
    else
        puts""
        puts "Merci d'avoir participé! Vous êtes fantastique. "
        match = false
    end
end
