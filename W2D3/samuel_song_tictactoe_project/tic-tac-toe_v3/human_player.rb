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

    def get_position(legal_positions)
        puts "-------------------------------------------------------"
        puts "Player #{self.mark}'s turn!"
        puts "Enter a position on the board in the following format. "
        puts "NUMBER space NUMBER"
        puts "For example:"
        puts "0 2"
        input = gets.chomp
        row = input.split[0].to_i
        col = input.split[1].to_i
        position = [row, col]
        if !legal_positions.include?(position)
            puts "-------------------------------------------------------"
            puts "Please enter a legal move."
            return self.get_position(legal_positions)
        end
        position
    end
end
