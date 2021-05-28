# Maze solver
# In this exercise, we want to write a
# program that will find a route between
# two points in a maze.

# Here's an example maze. It has an 'S' for
# the start point, and an 'E' for an end point.

# You should write a program that will read in
# the maze, try to explore a path through it to
# the end, and then print out a completed path
# like so. If there is no such path, it should inform the user.

# Make your program run as a command line script,
# taking in the name of a maze file on the command line.

# Your path through the maze should not be
# self-intersecting, of course.

# When you have found a first solution, write a
# version which will be sure to find the shortest path through the maze.

# ****************
# *         *   E*
# *    *    *  ***
# *    *    *    *
# *    *    *    *
# *    *    *    *
# *S   *         *
# ****************

# ****************
# *XXXXXXXXX* XXE*
# *X   *   X* X***
# *X   *   X* X  *
# *X   *   X* X  *
# *X   *   X* X  *
# *S   *   XXXX  *
# ****************

require "byebug"

class Solver

  attr_reader
  attr_writer
  attr_accessor :maze, :current_pos, :open_list, :closed_list

  def initialize
    @maze = self.create_maze
    @start_pos = self.find_start_pos
    @end_pos = self.find_end_pos
    @current_pos = @start_pos

    @open_list = []
    @closed_list = []

    @f_grid = Array.new(3) { Array.new(3) }

  end

  def [](pos)
    i, j = pos[0], pos[1]
    maze[i][j]
  end

  def []=(pos, val)
    i = pos[0]
    j = pos[1]
    maze[i][j] = val
  end

  def create_maze
    file = File.open("maze1.txt")
    file = file.readlines.map(&:chomp)
    file.map { |string| string.split("") }
  end

  def find_start_pos
    maze.each_with_index do |row, i|
      row.each_with_index do |space, j|
        return [i, j] if space == "S"
      end
    end
  end

  def find_end_pos
    maze.each_with_index do |row, i|
      row.each_with_index do |space, j|
        return [i, j] if space == "E"
      end
    end
  end

  def calculate_f

  end

  def create_search_grid(pos)
    search_grid = []
    i = pos[0]
    j = pos[1]
    ((i-1)..(i+1)).each do |idx_1|
      row = []
      ((j-1)..(j+1)).each do |idx_2|
        if (idx_1 >= 0 && idx_1 < maze.length) && (idx_2 >= 0 && idx_2 < maze[0].length)
          search_pos = [idx_1, idx_2]
          row << self[search_pos]
        else
          row << nil
        end
      end
      search_grid << row
    end
    search_grid
  end

end

#  - read maze txt file and store it
#  - find "S"
#  - find "E"
#  - create current position and set it to S position
#  - check surrounding spaces
#  -  - create list of possible surrounding spaces to move to
#  -  - calculate F, (F = G + H), for each move
#  -  - store move and F value in array --> hash with move order as keys
#  -  - choose space with lowest F value
#  -  - mark space with X
#  -  - set current position to space
#  -  - store current pos location in array

#  - divide search area into a grid and each marked as walkable or unwalkable
#  - G --> horizontal/vertical = 10, diag = 14
#  - H --> num of squares from end (using only hor/vert moves * 10)
