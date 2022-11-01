class Election
  attr_reader :year, :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end

  def candidates
    @races.map { |race| race.candidates}.flatten
  end

  def vote_counts
    overall_count = {}
    candidates.each do |candidate|
      overall_count[candidate.name] = candidate.votes
    end
    overall_count
  end

  def winners
    @races.map { |race| race.winner}
  end
end
