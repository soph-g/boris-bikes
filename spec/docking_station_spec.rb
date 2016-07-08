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
    let(:bike) { double :bike }
    it 'docks a working bike' do
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises an error when full' do
      subject.capacity.times {subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error "Docking station full"
    end
    it 'docks a broken bike' do
      allow(bike).to receive(:broken?).and_return(true)
      expect(subject.dock(bike)).to eq [bike]
    end
  end

  describe '#release_bike' do
    let(:bike) { double :bike }

    it 'raises an error when no bikes are available' do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
    it 'releases a working bike' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).not_to be_broken
    end
    it 'does not release broken bikes' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "Bike is broken, cannot be released"
    end
  end
end
