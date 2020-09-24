class CalculateParkingCost
  include Interactor::Organizer

  organize ParkingCosts::PrepareParams,
    ParkingCosts::CalculateSuitableRateAmount

  test_name
  reg_12
end
