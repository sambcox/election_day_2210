require "./lib/candidate"

RSpec.describe Candidate do
  it 'exists' do
    can = Candidate.new({name: "Diana D", party: :democrat})

    expect(can).to be_a(Candidate)
  end
end