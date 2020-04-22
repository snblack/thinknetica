require "./route.rb"

class Train < Route
  # Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и
  # количество вагонов, эти данные указываются при создании экземпляра класса
  attr_reader :num, :type, :speed, :wagons

  def initialize(num, type, wagons)
    @num = num
    @type = type
    @wagons = wagons
    @speed = 0
  end

  # Может набирать скорость
  def gather_speed(speed)
    @speed += speed
  end

  # Может тормозить (сбрасывать скорость до нуля)
  def to_brake
    @speed = 0
  end

  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию,
  # метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд
  # не движется.

  def add_wagons
    if @speed == 0
      @wagons += 1
    else
      puts 'Поезд находится в движении'
    end
  end

  def del_wagons
    if @speed == 0
      @wagons -= 1
    else
      puts 'Поезд находится в движении'
    end
  end

  # Может принимать маршрут следования (объект класса Route)
  # При назначении маршрута поезду, поезд автоматически помещается
  # на первую станцию в маршруте.
  def take_route(route_obj)
    @route = route_obj
    @route.stations[0].take_train(self)
  end

  def current_station
    @route.stations.find { |station| station.list_trains.include?(self) }
  end
  # А где метод который будет принимать маршрут и ставить поезд
  # на первую станцию этого маршрута? Если бы он был,
  # то в этом месте не понадобился бы параметр route_obj

  def current_station_index
    @route.stations.index(current_station)
  end

  # Может перемещаться между станциями, указанными в маршруте.
  # Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def moving_forward
    @current_station_index = current_station_index
    current_station.send(self)
    @route.stations[@current_station_index + 1].take_train(self)
  end

  def moving_backward
    @current_station_index = current_station_index
    current_station.send(self)
    @route.stations[@current_station_index - 1].take_train(self)
  end

  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def print_current_status
    if current_station_index > 0
      puts "Предыдущая станция: #{@route.stations[current_station_index - 1].name_station }"
    end
    puts "Текущая станция: #{current_station(@route).name_station}"
    if current_station_index < @route.stations.size - 1
    puts "Следующая станция: #{@route.stations[current_station_index + 1].name_station}"
    end
  end
end
