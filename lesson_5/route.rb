require "./station.rb"
require "./instance_counter.rb"

class Route

  attr_reader :num

  include InstanceCounter
  create_variable_instances

  def initialize(from, to, num)
    @from = from
    @to =to
    @num = num
    @inter_stations = []
    register_instance
  end

  def stations
    [@from, *@inter_stations, @to]
  end

  # Добавляет промежуточную станцию в список
    def add_station(station)
      @inter_stations << station
    end

  # Удаляет промежуточную станцию из списка
    def delete_station(station)
      @inter_stations.delete(station){'Станция не найдена'}
    end

  # Выводить список всех станций
    # def print_all_station
    #     stations.each { |station| puts station.name_station }
    # end

    def self.search_by_num(num)
      if Route.hash.values.include?(num)
        route = Route.hash.select { |route, num_route| num_route == num }
        route.keys[0]
      else
          puts "Сразу создайте такой маршрут"
          abort
      end
    end

    private
    #используется только внутри класса

    def self.hash
      routes = ObjectSpace.each_object(Route).to_a
      hash = {}
      routes.each { |route| hash[route] = route.num }
      hash
    end

end
