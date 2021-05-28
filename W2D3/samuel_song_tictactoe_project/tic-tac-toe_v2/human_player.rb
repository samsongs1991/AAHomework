# The HumanPlayer class is responsible for ...
#     1. holding information about the user and
#     2. prompting them to enter a position for gameplay.

# Instance methods available are
#     1. get_position - gets user input and returns position [#,#]

class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "-------------------------------------------------------"
        puts "Enter a position on the board in the following format. "
        puts "NUMBER space NUMBER"
        puts "For example:"
        puts "0 2"
        input = gets.chomp
        if input.split.length != 2
            puts "-------------------------------------------------------"
            puts "Invalid input. Enter 2 numbers. Please try again."
            puts "Type 'your game name'.play to continue playing. (example: game_1.play)"
            raise
        end
        input.each_char { |char|
            if !" 0123456789".include?(char)
                puts "-------------------------------------------------------"
                puts "Invalid input. Enter numbers. Please try again."
                puts "Type 'your game name'.play to continue playing. (example: game_1.play)"
                raise
            end
        }
        row = input.split[0].to_i
        col = input.split[1].to_i
        puts "-------------------------------------------------------"
        position = [row, col]
    end
end
