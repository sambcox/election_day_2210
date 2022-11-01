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
  end
end