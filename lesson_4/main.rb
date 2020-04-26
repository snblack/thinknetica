require "./station.rb"
require "./train.rb"
require "./route.rb"
require "./cargo_train.rb"
require "./passenger_train.rb"
require "./interface.rb"
require "./wagon.rb"

interface = Interface.new
# interface.seed

loop do

  interface.start

  break if interface.select == 4

  case interface.select
  when 1
    interface.work_with_stations

    if interface.select == 1
      interface.create_station

    elsif interface.select == 2
      interface.list_trains_on_station
    end

  when 2
    interface.work_with_trains

    if interface.select == 1
      interface.create_train

    elsif interface.select == 2
      interface.train_take_route

    elsif interface.select == 3
      interface.add_wagon

    elsif interface.select == 4
      interface.del_wagon

    elsif interface.select == 5
      interface.moving_forward

    elsif interface.select == 6
      interface.moving_backward
    end

  when 3
    interface.work_with_routes

    if interface.select == 1
      interface.create_route
    elsif interface.select == 2
      interface.add_station_to_route
    elsif interface.select == 3
      interface.del_station_from_route
    elsif interface.select == 4
      interface.list_station_in_route
    end
  end
end
