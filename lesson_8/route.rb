# frozen_string_literal: true

require './station.rb'
require './instance_counter.rb'

class Route
  attr_reader :num

  include InstanceCounter
  create_variable_instances

  def initialize(from, to, num)
    @from = from
    @to = to
    @num = num
    @inter_stations = []
    validate!
    register_instance
  end

  def stations
    [@from, *@inter_stations, @to]
  end

  def add_station(station)
    @inter_stations << station
  end

  def delete_station(station)
    @inter_stations.delete(station) { 'Станция не найдена' }
  end

  def self.search_by_num(num)
    if Route.hash.values.include?(num)
      route = Route.hash.select { |_route, num_route| num_route == num }
      route.keys[0]
    else
      puts 'Сразу создайте такой маршрут'
      abort
    end
  end

  protected

  def validate!
    raise 'Номер маршрута не задан' if num.nil?
    return unless num.size < 3 || num.size > 3

    raise 'Номер маршрута должен состоять из 3 цифр'
  end

  def self.hash
    routes = ObjectSpace.each_object(Route).to_a
    hash = {}
    routes.each { |route| hash[route] = route.num }
    hash
  end
end
