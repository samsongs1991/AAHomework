# The Board class is responsible for ...
    # adding a player's marks,
    # checking for winners,
    # and printing the game board.

# Instance methods available are
#     1. valid?(position) - returns boolean
#     2. empty?(position) - returns boolean
#     3. place_mark(position, mark) - mutates the grid
#     4. print - prints grid
#     5. win?(mark) - returns boolean
#     6. empty_positions? - returns boolean

class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '-') }
    end

    def valid?(position) # position = [i, j]
        i = position[0]
        j = position[1]
        i > @grid.length - 1 || j > @grid.length - 1 ? false : true
    end

    def empty?(position) # position = [i, j]
        i = position[0]
        j = position[1]
        @grid[i][j] == "-"
    end

    def place_mark(position, mark) # position = [i, j]
        i = position[0]
        j = position[1]
        if valid?(position) && empty?(position)
            @grid[i][j] = mark
            true
        else
            puts "That position is outside the board and/or already marked."
            false
        end
    end

    def print
        puts
        puts
        @grid.each { |row|
            temp_row = ''
            row.each { |el|
                temp_row += el.to_s + '  '
            }
            puts temp_row
        }
        puts
        puts
    end

    def win_row?(mark)
        @grid.each { |row|
            return true if row.all? { |el| el == mark }
        }
        false
    end

    def win_col?(mark)
        @grid.transpose.each { |row|
            return true if row.all? { |el| el == mark }
        }
        false
    end

    def win_diagonal?(mark)
        diag_1 = true
        diag_2 = true
        j = @grid.length - 1
        (0..@grid.length - 1).each { |i|
            diag_1 = false if @grid[i][i] != mark
            diag_2 = false if @grid[i][j] != mark
            j -= 1
        }
        diag_1 || diag_2
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?("-")
    end
end
