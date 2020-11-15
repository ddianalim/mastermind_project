class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |char|
      if !POSSIBLE_PEGS.has_key?(char.upcase)
        return false
      end
    end
    return true
  end

  attr_reader :pegs
  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "array does not contain valid pegs"
    end
  end

  def self.random(length)
    new_arr = []
    letters = ["R", "G", "B", "Y"]
    length.times do
      new_arr << POSSIBLE_PEGS[ letters[rand(3)] ]
    end
    Code.new(new_arr)
  end
end
