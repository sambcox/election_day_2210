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
end