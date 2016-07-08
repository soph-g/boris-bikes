require "bike"

describe Bike do
  it "can be reported is broken" do
    (bike = Bike.new).report_broken
    expect(bike.broken?).to eq true
  end
end
