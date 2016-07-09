require_relative 'docking_station'
require_relative 'garage'

class Van

  def collect_broken(station)
     @bikes = station.broken_bikes
  end

  def deliver_broken(garage)
    garage.fix_bikes(@bikes)
    @bikes = []
  end

end
