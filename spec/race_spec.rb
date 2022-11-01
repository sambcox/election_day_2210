require "./lib/candidate"
require "./lib/race"

RSpec.describe Race do
  it 'exists' do
    race = Race.new("Texas Governor")

    expect(race).to be_a(Race)
  end

  it 'has an office' do
    race = Race.new("Texas Governor")

    expect(race.office).to eq("Texas Governor")
  end

  it 'has no candidates by default' do
    race = Race.new("Texas Governor")

    expect(race.candidates).to eq([])
  end

  it 'can add candidates' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})

    expect(candidate1).to be_a(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(race.candidates).to eq([candidate1])

    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it 'is open by default' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

    expect(race.open?).to eq true
  end

  it 'can be closed' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    race.close!

    expect(race.open?).to eq false
  end

  it 'has a winner except when open' do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    50.times {candidate1.vote_for!}
    3.times {candidate2.vote_for!}

    expect(race.winner).to eq false

    race.close!

    expect(race.winner).to eq(candidate1)

    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    50.times {candidate2.vote_for!}
    3.times {candidate1.vote_for!}
    race.close!

    expect(race.winner).to eq(candidate2)
  end
end