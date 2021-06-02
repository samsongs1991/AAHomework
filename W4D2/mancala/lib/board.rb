class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = Player.new(name1, 1)
    @player_2 = Player.new(name2, 2)
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, i|
      if i == 6 || i == 13
        self.cups[i] = []
      else
        self.cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12 || start_pos == 6
      raise "Invalid starting cup"
    elsif cups[start_pos].empty?
      raise "Starting cup is empty"
    else
      true
    end
  end

  def make_move(start_pos, current_player_name)
    if current_player_name.side == 1 && 0 <= start_pos && start_pos <= 5
      if valid_move?(start_pos)
        in_hand = cups[start_pos].dup
        cups[start_pos] = []

        i = start_pos + 1
        until in_hand.empty?
          i = 0 if i == 14
          cups[i] << in_hand.shift unless i == 13
          i += 1
        end
      end
    elsif current_player_name.side == 2 && 7 <= start_pos && start_pos <= 12
      if valid_move?(start_pos)
        in_hand = cups[start_pos].dup
        cups[start_pos] = []

        i = start_pos + 1
        until in_hand.empty?
          i = 0 if i == 14
          cups[i] << in_hand.shift unless i == 6
          i += 1
        end
      end
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
