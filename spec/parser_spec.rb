require "rspec"
require_relative "../parser"

describe Parser do
  subject(:parser) { described_class.new(interactors_path, file_path) }

  let(:interactors_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/" }
  let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb" }

  context "#parse_constants" do
    it "returns all constants" do
      expect(parser.parse_constants(file_path)).to match_array(
        ["CalculateParkingCost", "Interactor::Organizer"]
      )
    end

    context "when class in a module" do
      let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/calculate_suitable_rate_amount.rb" }

      it "adds module name to classname" do
        expect(parser.parse_constants(file_path)).to match_array(
          ["ParkingCosts::Discounts::PrepareParams"]
        )
      end
    end
  end

  context "#parse_interactors" do
    let(:classes) { ["CalculateParkingCost", "Interactor::Organizer", "SomeInteractor"] }

    it "returns all interactors" do
      expect(parser.parse_interactors(classes)).to match_array(
        ["CalculateParkingCost", "SomeInteractor"]
      )
    end
  end

  context "#parse_files_paths" do
    let(:classes) { ["CalculateParkingCost", "SomeInteractor"] }

    it "returns file path by class" do
      expect(parser.parse_files_paths(classes)).to match_array(
        [
          "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb",
          "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb"
        ]
      )
    end
  end
end
