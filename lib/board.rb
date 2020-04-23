require 'bundler'
Bundler.require

class Board

    attr_accessor :A1, :A2, :A3, :B1, :B2, :B3, :C1, :C2, :C3

    def initialize
        @A1 = Box.new("A1")
        @A2 = Box.new("A2")
        @A3 = Box.new("A3")
        @B1 = Box.new("B1")
        @B2 = Box.new("B2")
        @B3 = Box.new("B3")
        @C1 = Box.new("C1")
        @C2 = Box.new("C2")
        @C3 = Box.new("C3")
    end

    def vizualisation
        puts ""
        puts "  1 2 3"
        puts "A|#{@A1.content}|#{@A2.content}|#{@A3.content}|"
        puts "B|#{@B1.content}|#{@B2.content}|#{@B3.content}|"
        puts "C|#{@C1.content}|#{@C2.content}|#{@C3.content}|"
        puts ""
    end

    def array_creation

        array_of_box = []
        array_of_box << @A1
        array_of_box << @A2
        array_of_box << @A3
        array_of_box << @B1
        array_of_box << @B2
        array_of_box << @B3
        array_of_box << @C1
        array_of_box << @C2
        array_of_box << @C3
        
        return array_of_box

    end

end
