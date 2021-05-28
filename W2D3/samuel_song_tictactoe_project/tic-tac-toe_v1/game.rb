# The Game class will be the main class that ...
#     Houses the instances of Board and HumanPlayer.
#     It will be responsible for passing data between the board and players.
#     It will also serve to contain the main game loop.

require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            valid_input = @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                return "#{@current_player.mark} has won! Victory!"
            end
            self.switch_turn if valid_input
        end
        puts "DRAW! There are no more empty spaces on the board."
    end
end
