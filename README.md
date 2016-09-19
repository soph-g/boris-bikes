# Boris Bikes #

Week 1 project, building a Boris Bikes program.

## How to use

In irb:

```shell
require './lib/docking_station.rb'
station = DockingStation.new
bike = Bike.new
station.dock(Bike.new)
bike.report_broken
state.release_bike
```

## Useful information

Docking stations have a default capacity of 20, but this can be changed by passing in a capacity on initialize.

Bikes can be working or not working, and can be reported as broken. A bike will not be released from the docking station if it has been reported as broken.

The docking station will stop releasing bikes when it is empty, and stop accepting bikes when it is full.

Garage and van classes were in progress when this project week finished.
