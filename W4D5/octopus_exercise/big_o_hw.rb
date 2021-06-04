arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Find longest fish string in O(n^2) time
def slow_octopus(arr)
  # arr.inject do |acc, el|
  #   el.length > acc.length ? el : acc
  # end

  # longest_fish = arr[0]
  # arr.each do |fish|
  #   count = 0
  #   fish.each_char do |char|
  #     count += 1
  #   end
  #   if count > longest_fish.length
  #     longest_fish = fish
  #   end
  # end
  # longest_fish

  longest_fish = arr[0]
  (0...arr.length - 1).each do |i|
    (i + 1..arr.length - 1).each do |j|
      longest_fish = arr[j] if arr[j].length > arr[i].length
    end
  end
  longest_fish
end

p slow_octopus(arr)

def fast_octopus(arr)
  return arr if arr.length == 1

  right = []

  arr[1..-1].each do |el|
    case el.length <=> arr[0].length
    when 1
      right << el
    end
  end

  fast_octopus(right)
end

p fast_octopus(arr)[0]

def clever_octopus(arr)
  longest_fish = arr[0]
  arr.each { |fish| longest_fish = fish if fish.length > longest_fish.length }
  longest_fish
end

p clever_octopus(arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile_dir, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == tile_dir }
  "Octopus trips and falls on its head..."
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)


tiles_hash = {
  "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3,
  "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7
  }

def fast_dance(tile_dir, tiles_hash)
  # tiles_array.index(tile_dir)
  tiles_hash[tile_dir]
end

p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)
