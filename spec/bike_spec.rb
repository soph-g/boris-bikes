require "bike"

describe Bike do
  it {is_expected.to respond_to(:working)}

  it {is_expected.to respond_to(:report_broken)}

  it "can be reported is broken" do
    (bike = Bike.new).report_broken
    expect(bike.working).to eq false
  end
end
