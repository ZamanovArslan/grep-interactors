require "rspec"
require_relative "../parser"

describe Parser do
  subject(:parser) { described_class.new(interactors_path, file_path) }

  let(:interactors_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/" }
  let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/some_interactor.rb" }

  context "#file_paths" do
    it "returns all file paths" do
      expect(parser.file_paths).to match_array(
        [
          "/home/ars/Projects/organizer-searcher/spec/interactors/calculate_parking_cost.rb",
          "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/prepare_params.rb",
          "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/calculate_suitable_rate_amount.rb",
          "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/discounts/prepare_params.rb"
        ]
      )
    end
  end

  context "#parse_interactors" do
    it "returns all constants" do
      expect(parser.parse_interactors(file_path)).to match_array(
        ["CalculateParkingCost"]
      )
    end

    context "when class in a module" do
      let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/calculate_suitable_rate_amount.rb" }

      it "adds module name to classname" do
        expect(parser.parse_interactors(file_path)).to match_array(
          ["ParkingCosts::Discounts::PrepareParams"]
        )
      end
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

  context "#get_full_class_name" do
    let(:get_full_class_name) {  }
    let(:class_name) { "Discounts::PrepareParams" }
    let(:file_path) { "/home/ars/Projects/organizer-searcher/spec/interactors/parking_costs/calculate_suitable_rate_amount.rb" }

    it "returns full class name" do
      expect(parser.get_full_class_name(class_name, file_path)).to eq("ParkingCosts::Discounts::PrepareParams")
    end
  end
end
