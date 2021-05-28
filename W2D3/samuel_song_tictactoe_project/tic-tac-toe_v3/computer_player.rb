class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        puts "-------------------------------------------------------"
        puts "Computer #{self.mark}'s turn!"
        puts "Computer '#{self.mark}' has chosen #{position}."
        puts "-------------------------------------------------------"
        position
    end
end
