require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end


  def release_bike
      fail "No bikes available" if self.empty?
      @bikes.pop
    end

  def dock(bike)
    fail "Docking station full" if self.full?
    @bikes << bike
  end

  def full?
    @bikes.count >= 20 ? true : false
  end

  def empty?
    @bikes.empty?
  end


end
