require "garage"
require "van"

describe Garage do
  describe "#fix_bikes" do
    it 'accepts broken_bikes' do
      station = DockingStation.new
      (bike = Bike.new).report_broken
      station.dock(bike)
      van = Van.new
      bikes = van.collect_broken(station)
      expect(subject.fix_bikes(bikes)).to eq bikes
    end
  end
end
