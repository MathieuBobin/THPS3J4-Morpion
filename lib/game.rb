require 'bundler'
Bundler.require

class Game
    attr_accessor :player1, :player2 , :board
    
    def initialize #initalisation de la partie 
        
        #Création du premier joueur
        puts "Quel est le nom du premier joueur?"
        user_answer_name1 = gets.chomp
        @player1 = Player.new(user_answer_name1)
        @player1.pawn_type_X
        puts "Très bien #{@player1.name}! Tu joueras donc avec les pions de type : #{@player1.pawn}"

        puts ""

        #Création du deuxième joueur
        puts "Quel est le nom du deuxième joueur?"
        user_answer_name2 = gets.chomp
        @player2 = Player.new(user_answer_name2)
        @player2.pawn_type_O
        puts "Salut #{@player2.name}! Tu joueras avec les pions de type #{@player2.pawn}"
        puts ""

        #Création du jeu
        @board = Board.new
    end

    def game_round #lancement du jeu
        puts "Pour continuer, appuie sur > [ENTREE]"
        gets.chomp
        #Introduction
        puts "Voici l'état du jeu: "
        board.vizualisation
        self.battle_round
        puts "La partie est terminée!"
    end

    def battle_round

        array_box = board.array_creation #on crée un array avec toutes les cases du jeu
        count = 0

        while self.success != true  #la boucle continue tant que les conditions de succès ne sont pas réunies
             
            #Le premier joueur commence
            puts "#{@player1.name} où souhaites-tu placer ton pion? (Pour rappel tu joues avec les pions: #{@player1.pawn})"
            
            #on teste la validité de la réponse du premier joueur
            match = false
            while match !=true 
                y = 0
                user_answer_pawn1 = gets.chomp
                array_box.each do |x|
                    if x.position == user_answer_pawn1 && x.content == " "
                        y = y+1
                    end
                end
                if y == 1 
                    match = true 
                else
                    puts "Action impossible! Soit la case est déja remplie, soit tu n'as pas rempli les bonnes coordonnées!"
                end
            end


            #si la réponse remplie bien les conditions, on remplace la donnée de l'objet board
            array_box.each do |x|
                if x.position == user_answer_pawn1
                    x.content = @player1.pawn
                end
            end

            board.vizualisation
            count = count +1

            #on verifie si les conditions de succès sont réunies en appelant la méthode success
            break puts if self.success == true

            #on verifie les 9 tours sont passés
            break puts "Match nul" if count == 9

            #Le deuxiÈme joueur joue ensuite
            puts "#{@player2.name} où souhaites-tu placer ton pion? (Pour rappel tu joues avec les pions: #{@player2.pawn})"
            match = false
            while match !=true 
                y = 0
                user_answer_pawn2 = gets.chomp
                array_box.each do |x|
                    if x.position == user_answer_pawn2 && x.content == " "
                        y = y+1
                    end
                end
                if y == 1 
                    match = true 
                else
                    puts "Action impossible! Soit la case est déja remplie, soit tu n'as pas rempli les bonnes coordonnées"
                end
            end

            array_box.each do |x|
                if x.position == user_answer_pawn2
                    x.content = @player2.pawn
                end
            end 

            board.vizualisation
            count = count +1

        end
    end
    
    def success #définit les conditions de fin de partie

        #check des lignes
        if  @board.A1.content + @board.A2.content + @board.A3.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.A1.content + @board.A2.content + @board.A3.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true
        elsif  @board.B1.content + @board.B2.content + @board.B3.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.B1.content + @board.B2.content + @board.B3.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true
        elsif  @board.C1.content + @board.C2.content + @board.C3.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.C1.content + @board.C2.content + @board.C3.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true

        #check des colonnes
        elsif  @board.A1.content + @board.B1.content + @board.C1.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.A1.content + @board.B1.content + @board.C1.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true
        elsif  @board.A2.content + @board.B2.content + @board.C2.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.A2.content + @board.B2.content + @board.C2.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true
        elsif  @board.A3.content + @board.B3.content + @board.C3.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif  @board.A3.content + @board.B3.content + @board.C3.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true

        #check des diagonales
        elsif @board.A1.content + @board.B2.content + @board.C3.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif @board.A1.content + @board.B2.content + @board.C3.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true
        elsif @board.A3.content + @board.B2.content + @board.C1.content == @player1.pawn*3  
            puts "#{@player1.name} a gagné!"
            return true
        elsif @board.A3.content + @board.B2.content + @board.C1.content == @player2.pawn*3  
            puts "#{@player2.name} a gagné!"
            return true    
        else
            return false
        end
    end

end
