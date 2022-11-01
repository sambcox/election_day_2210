class Race
  attr_reader :office, :candidates
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(data)
    new_candidate = Candidate.new(data)
    @candidates << new_candidate
    new_candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      return false
    else
      @candidates.sort_by do |candidate|
        candidate.votes
      end.last
    end
  end

  def tie?
    if !open?
      @candidates.find_all { |candidate| candidate.votes == winner.votes}.length > 1
    end
  end
end
