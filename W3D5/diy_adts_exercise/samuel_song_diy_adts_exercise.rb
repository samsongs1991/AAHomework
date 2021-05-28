# Exercise 1 -----------------------------------------------------

class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    @stack << el
  end

  def pop
    # removes one element from the stack
    @stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    return nil if @stack.empty?
    @stack[-1]
  end
end

# Exercise 2 -----------------------------------------------------

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    # @queue.push(el)
  end

  def dequeue
    @queue.pop
    # @queue.shift
  end

  def peek
    @queue[-1]
  end
end

# Exercise 3 -----------------------------------------------------

class Map

  def initialize
    @map = []
  end

  def set(key, value)
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each { |pair| return pair if pair[0] == key }
  end

  def delete(key)
    @map.delete_if { |pair| pair[0] == key }
  end

  def show
    puts
    puts "[key, value]"
    puts "------------"
    @map.each { |pair| puts "#{pair} " }
  end
end
