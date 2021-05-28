# The Game class will be the main class that ...
#     Houses the instances of Board and HumanPlayer.
#     It will be responsible for passing data between the board and players.
#     It will also serve to contain the main game loop.

require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(n, hash)
        @players = []
        hash.each { |mark, human| human ? @players << HumanPlayer.new(mark) : @players << ComputerPlayer.new(mark) }
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position(@board.legal_positions)
            valid_input = @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                return "#{@current_player.mark} has won! Victory!"
            end
            self.switch_turn if valid_input
        end
        @board.print
        puts "DRAW! There are no more empty spaces on the board."
    end
end
