RSpec.describe GrepInteractors do
  let(:interactors_path) { "#{Dir.pwd}/spec/interactors/" }
  let(:file_path) { "#{Dir.pwd}/spec/interactors/some_interactor.rb" }
  let(:query) { "test_name" }

  it ".call" do
    expect(described_class.call(interactors_path, file_path, query)).to match_array([
      "#{Dir.pwd}/spec/interactors/calculate_parking_cost.rb:7",
      "#{Dir.pwd}/spec/interactors/parking_costs/prepare_params.rb:5",
      "#{Dir.pwd}/spec/interactors/parking_costs/prepare_params.rb:7",
      "#{Dir.pwd}/spec/interactors/parking_costs/discounts/prepare_params.rb:4",
    ])
  end
end
