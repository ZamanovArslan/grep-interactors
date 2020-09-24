RSpec.describe GrepInteractors::GrepInPaths do
  subject(:grep_in_paths) { described_class.new }
  let(:file_paths) do
    [
      "#{Dir.pwd}/spec/interactors/calculate_parking_cost.rb",
      "#{Dir.pwd}/spec/interactors/some_interactor.rb",
      "#{Dir.pwd}/spec/interactors/parking_costs/prepare_params.rb",
      "#{Dir.pwd}/spec/interactors/parking_costs/discounts/prepare_params.rb"
    ]
  end

  context "#call" do
    let(:query) { "test_name" }

    it "returns all entries" do
      expect(grep_in_paths.call(query, file_paths)).to match_array(
        [
          "#{Dir.pwd}/spec/interactors/calculate_parking_cost.rb:7",
          "#{Dir.pwd}/spec/interactors/some_interactor.rb:6",
          "#{Dir.pwd}/spec/interactors/parking_costs/prepare_params.rb:5",
          "#{Dir.pwd}/spec/interactors/parking_costs/prepare_params.rb:7",
          "#{Dir.pwd}/spec/interactors/parking_costs/discounts/prepare_params.rb:4",
        ]
      )
    end

    context "when query is regex" do
      let(:query) { "reg_[0-9]*" }
      subject(:grep_in_paths) { described_class.new(string_matcher: StringMatcher::Regex) }

      it "returns matches" do
        expect(grep_in_paths.call(query, file_paths)).to match_array(
          [
            "#{Dir.pwd}/spec/interactors/calculate_parking_cost.rb:8",
          ]
        )
      end
    end
  end
end