require 'bundler'
Bundler.require

class Player
    attr_accessor :name, :pawn

    def initialize (name_new)
        @name = name_new
    end

    def pawn_type_X
        @pawn = "X"
    end 

    def pawn_type_O
        @pawn = "O"
    end 
end