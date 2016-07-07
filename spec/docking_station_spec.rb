require "docking_station"

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq subject.capacity
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises an error when full' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error "Docking station full"

    end
  end

  describe '#release_bike' do
    it 'raises an error when no bikes are available' do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
end
