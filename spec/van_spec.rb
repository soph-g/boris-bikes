require "van"

describe Van do
  describe '#collect_broken' do
    context 'when collect_broken is called' do
      it { is_expected.to respond_to :collect_broken }
    end
    it 'accepts a station argument' do
      station = double(:station)
      expect(subject.collect_broken(station)).to eq station
    end
    #it 'returns a broken bike' do
    #  station = DockingStation.new
    #  bike = Bike.new
    #  bike.report_broken
    #  station.dock(bike)
    #  expect(subject.collect_broken(station)).to eq bike
    #end
  end
end
