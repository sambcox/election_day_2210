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
end