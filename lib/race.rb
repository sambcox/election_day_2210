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
end
