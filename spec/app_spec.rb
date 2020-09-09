require_relative "../grep_in_paths"

describe GrepInPaths do
  let(:file_paths) do
    [
      "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb",
      "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb",
      "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/prepare_params.rb",
      "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/discounts/prepare_params.rb"
    ]
  end

  context "#grep_in_interactors" do
    let(:query) { "test_name" }

    it "returns all entries" do
      expect(described_class.call(query, file_paths)).to match_array(
        [
          "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb: 7",
          "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb: 6",
          "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/prepare_params.rb: 5",
          "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/discounts/prepare_params.rb: 4",
        ]
      )
    end
  end
end