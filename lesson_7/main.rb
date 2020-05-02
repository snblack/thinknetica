require "./station.rb"
require "./train.rb"
require "./route.rb"
require "./cargo_train.rb"
require "./passenger_train.rb"
require "./interface.rb"
require "./wagon.rb"
require "./wagon_passenger.rb"
require "./wagon_cargo.rb"

interface = Interface.new
interface.seed
interface.start
