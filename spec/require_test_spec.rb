require "rspec"
require "active_support"

describe "Require" do
  it "can load" do
    require_relative "interactors/not_interactor"
  rescue NameError => e
    puts e.inspect
  end

  it "can constantize" do
    expect(ActiveSupport::Inflector.constantize("App")).to eq(App)
  end
end
