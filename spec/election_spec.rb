require "./lib/candidate"
require "./lib/race"
require "./lib/election"

RSpec.describe Election do
  it 'exists' do
    election = Election.new('2022')

    expect(election).to be_a(Election)
  end

  it 'has a year' do
    election = Election.new('2022')

    expect(election.year).to eq('2022')
  end

  it 'has no races by default' do
    election = Election.new('2022')

    expect(election.races).to eq([])
  end

  it 'can add races' do
    election = Election.new('2022')
    race1 = Race.new("Virginia District 4 Representative")
    race2 = Race.new("Texas Governor")
    election.add_race(race1)
    election.add_race(race2)

    expect(election.races).to eq([race1, race2])
  end
end