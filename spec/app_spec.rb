require "rspec"
require_relative "../app"

describe App do
  subject(:app) { described_class.new(interactors_path, file_path) }

  let(:interactors_path) { "/home/ars/Projects/organizer-searcher/spec/interactors" }
  let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb" }

  context "#parse_constants" do
    it "returns all constants" do
      expect(app.parse_constants).to match_array(
        ["CalculateParkingCost", "Interactor::Organizer", "SomeInteractor"]
      )
    end
  end

  context "#parse_interactors" do
    let(:classes) { ["CalculateParkingCost", "Interactor::Organizer", "SomeInteractor"] }

    it "returns all interactors" do
      expect(app.parse_interactors(classes)).to match_array(
        ["CalculateParkingCost"]
      )
    end
  end

  context "#parse_files_paths" do
    let(:classes) { [CalculateParkingCost, SomeInteractor] }

    it "returns file path by class" do
      expect(app.parse_files_paths(classes)).to match_array(
        ["/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb", "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb"]
      )
    end
  end

  context "#grep_in_interactors" do
    let(:query) { "test_name" }

    it "returns all entries" do
      expect(app.grep_in_interactors(query)).to match_array(
        ["/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb: 7"]
      )
    end
  end
end
