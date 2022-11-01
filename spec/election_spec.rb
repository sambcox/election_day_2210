require "./lib/candidate"
require "./lib/race"
require "./lib/election"

RSpec.describe Election do
  it 'exists' do
    election = Election.new('2022')

    expect(election).to be_a(Election)
  end
end