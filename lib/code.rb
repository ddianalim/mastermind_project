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

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "array does not contain valid pegs"
    end
  end
end
