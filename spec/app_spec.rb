require "rspec"
require_relative "../app"

describe App do
  let(:interactors_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/" }
  let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb" }
  let(:query) { "test_name" }

  it ".call" do
    expect(described_class.call(interactors_path, file_path, query)).to match_array([
      "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb: 7",
      "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb: 6",
      "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/prepare_params.rb: 5",
      "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/discounts/prepare_params.rb: 4",
    ])
  end
end
