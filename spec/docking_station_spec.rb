require "docking_station"

describe DockingStation do

  it 'has a default capacity if no argument is passed' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'can have a variable capacity' do
    station = DockingStation.new(50)
    expect(station.capacity).to eq 50
  end

  describe '#dock' do
    it 'docks a working bike' do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises an error when full' do
      bike = double(bike)
      subject.capacity.times {subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error "Docking station full"
    end
    it 'docks a broken bike' do
      bike = double(:bike, broken?: true)
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#release_bike' do
    it 'raises an error when no bikes are available' do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
    it 'releases a working bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).not_to be_broken
    end
    it 'does not release broken bikes' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "Bike is broken, cannot be released"
    end
  end

  describe '#broken_bikes' do
    context 'when broken_bikes is called' do
      it { is_expected.to respond_to :broken_bikes }
    end
    it 'returns a broken bike' do
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      p station
      expect(station.broken_bikes).to eq [bike]
    end
  end
end
