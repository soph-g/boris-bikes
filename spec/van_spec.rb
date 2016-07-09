require "van"

describe Van do
  describe '#collect_broken' do
    it 'collects broken bikes from the docking station' do
      station = DockingStation.new
      (bike = Bike.new).report_broken
      station.dock(bike)
      expect(subject.collect_broken(station)).to eq [bike]
    end
  end

  describe '#deliver_broken' do
    #it {is_expected.to respond_to(:deliver_broken)}
    it 'delivers broken bikes to the garage' do
      station = DockingStation.new
      (bike = Bike.new).report_broken
      station.dock(bike)
      subject.collect_broken(station)
      garage = Garage.new
      expect(subject.deliver_broken(garage)).to eq []
    end
  end

end
