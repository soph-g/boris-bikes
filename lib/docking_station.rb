require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    fail "Bike is broken, cannot be released" if bike_broken?
    bikes.pop
  end

  def dock(bike)
    fail "Docking station full" if full?
    bikes << bike
  end

  def broken_bikes
    bikes.select { |bike| bike.broken? }
  end

private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  def bike_broken?
    (bikes.last).broken?
  end

end
