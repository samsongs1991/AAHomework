require "byebug"

class GraphNode
  attr_reader :value
  attr_writer
  attr_accessor :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end
end

def bfs(starting_node, target_value)
  # debugger
  queue = [starting_node]
  already_checked = []

  until queue.empty?
    current_node = queue.shift
    if current_node.value == target_value
      return current_node
    else
      current_node.neighbors.each do |neighbor_node|
        if !already_checked.include?(neighbor_node)
          queue << neighbor_node
          already_checked << current_node
        end
      end
    end
  end

  nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "f")
