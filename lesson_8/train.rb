# frozen_string_literal: true

# rubocop:disable Style/ClassVars

require './route.rb'
require './name_manufacturer.rb'
require './instance_counter.rb'

class Train < Route
  VALID_NUM = /^\d{3}+(-|)[А-Яа-я]{2}/.freeze

  attr_reader :num, :speed, :wagons

  include NameManufacturer
  include InstanceCounter
  create_variable_instances

  @@all = []

  def initialize(num)
    @num = num
    @speed = 0
    @wagons = []
    validate!
    @@all << self
    register_instance
  end

  def block
    @wagons.each { |wagon| yield(wagon) }
  end

  def self.find(num)
    @@all.find { |train| train.num == num }
  end

  def gather_speed(speed)
    @speed += speed
  end

  def to_brake
    @speed = 0
  end

  def add_wagon(wagon)
    puts 'Поезд находится в движении' if speed != 0
    @wagons << wagon
    wagon.num_wagon = wagons.index(wagon) + 1
  end

  def del_wagon(wagon)
    puts 'Поезд находится в движении' if speed != 0
    if @wagons.include(wagon)
      @wagons.delete(wagon)
      @index -= 1
    else
      puts 'Такого нет вагона у этого поезда'
    end
  end

  def take_route(route_obj)
    @route = route_obj
    @route.stations[0].take_train(self)
  end

  def current_station
    @route.stations.find { |station| station.list_trains.include?(self) }
  end

  def current_station_index
    @route.stations.index(current_station)
  end

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

# rubocop:disable all
  def print_current_status
    if current_station_index.positive?
      puts "Предыдущая станция:
      #{@route.stations[current_station_index - 1].name_station}"
    end
    puts "Текущая станция: #{current_station.name_station}"
    return unless current_station_index < @route.stations.size - 1

    puts "Следующая станция:
    #{@route.stations[current_station_index + 1].name_station}"
  end
# rubocop:enable all

  def self.search_by_num(num)
    if Train.hash.values.include?(num)
      train = Train.hash.select { |_train, num_train| num_train == num }
      train.keys[0]
    else
      puts 'Сразу создайте такой поезд'
      abort
    end
  end

  protected

  def validate!
    raise 'Номер поезда не задан' if num.nil?
    return unless num !~ VALID_NUM

    raise 'Номер должен быть в таком формате: 111-АА или 111АА'
  end

  def self.hash
    trains = ObjectSpace.each_object(Train).to_a
    hash = {}
    trains.each { |train| hash[train] = train.num }
    hash
  end
  private_class_method :hash
end
# rubocop:enable Style/ClassVars
