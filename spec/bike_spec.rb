require "bike"

describe Bike do
  it {is_expected.to respond_to(:working)}

  it {is_expected.to respond_to(:report_broken)}

  it "can be reported is broken" do
    (bike = Bike.new).report_broken
    #bike.report_broken
    puts bike
    expect(bike.working).to eq false
  end
end
