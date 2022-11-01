class Candidate
  attr_reader :name, :party
  def initialize(data)
    @name = data[:name]
    @party = data[:party]
  end
end
