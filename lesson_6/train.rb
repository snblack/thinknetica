require "./route.rb"
require "./name_manufacturer.rb"
require "./instance_counter.rb"

class Train < Route
  VALID_NUM = /^\d{3}+(-|)[А-Яа-я]{2}/

  attr_reader :num, :speed, :wagons

  include NameManufacturer
  include InstanceCounter
  create_variable_instances

  @@all = []

  def initialize(num)
    @num = num
    @speed = 0
    @wagons = []
    @@all << self
    register_instance
    validate!
  end

  def self.find(num)
    @@all.find {|train| train.num == num}
  end

  def gather_speed(speed)
    @speed += speed
  end

  def to_brake
    @speed = 0
  end

  def add_wagon(wagon)
    if self.speed != 0
      puts 'Поезд находится в движении'
    end
    if wagon.type == self.type
      @wagons << wagon
    else
      puts 'Вагон не подходит к грузовому поезду'
    end
  end

  def del_wagon(wagon)
    if self.speed != 0
      puts 'Поезд находится в движении'
    end
    if @wagons.include(wagon)
      @wagons.delete(wagon)
    else
      puts 'Такого нет вагона у этого поезда'
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
    puts "Текущая станция: #{current_station.name_station}"
    if current_station_index < @route.stations.size - 1
    puts "Следующая станция: #{@route.stations[current_station_index + 1].name_station}"
    end
  end

  def self.search_by_num(num)
    if Train.hash.values.include?(num)
      train = Train.hash.select { |train, num_train| num_train == num }
      train.keys[0]
    else
        puts "Сразу создайте такой поезд"
        abort
    end
  end

  protected

  def validate!
    raise 'Номер поезда не задан' if num.nil?
    raise 'Номер должен быть в таком формате: 111-АА или 111АА' if num !~ VALID_NUM
  end

  private
  #используется только внутри класса
  def self.hash
    trains = ObjectSpace.each_object(Train).to_a
    hash = {}
    trains.each { |train| hash[train] = train.num }
    hash
  end

end
