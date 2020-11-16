require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    # chars.each do |char|
    #   if !POSSIBLE_PEGS.has_key?(char.upcase)
    #     return false
    #   end
    # end
    # return true
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  attr_reader :pegs

  def self.random(length)
    new_arr = []
    # letters = ["R", "G", "B", "Y"]
    # length.times { new_arr << letters[rand(3)] }
    length.times { new_arr << POSSIBLE_PEGS.keys.sample }
    Code.new(new_arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise "array does not contain valid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    matches = 0
    # i = 0
    # while i < 4
    #   matches += 1 if guess[i] == @pegs[i]
    # i += 1
    # end
    # matches
    (0...guess.length).each do |i|
      matches += 1 if guess[i] == self[i]
    end
    matches
  end

  def num_near_matches(guess)
    near_matches = 0
    # i = 0
    # while i < 4
    #   near_matches += 1 if @pegs.include?(guess[i])
    # i += 1
    # end   
    # near_matches - num_exact_matches(guess)
    (0...guess.length).each do |i|
      near_matches += 1 if @pegs.include?(guess[i]) && guess[i] != self[i]
    end
    near_matches
  end

  def ==(code)
    # if code.length == self.length
    #   return num_exact_matches(code) == self.length
    # else
    #   return false
    # end
    @pegs == code.pegs
  end
end
