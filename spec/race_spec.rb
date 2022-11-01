require "./lib/candidate"
require "./lib/race"

RSpec.describe Race do
  it 'exists' do
    race = Race.new("Texas Governor")

    expect(race).to be_a(Race)
  end
end