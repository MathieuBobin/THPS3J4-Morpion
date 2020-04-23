require 'bundler'
Bundler.require

class Box 

    attr_accessor :position, :content

    def initialize (box_number)
        @position = box_number
        @content = " "
    end
end