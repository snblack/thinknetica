require "./station.rb"

class Route

# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываются при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(from, to)
    @from = from
    @to =to
    @inter_stations = []
  end

# Может добавлять промежуточную станцию в список
  def add_inter_station(inter_stations)
    @inter_stations << inter_stations
  end

# Может удалять промежуточную станцию из списка
  def delete_inter_station(inter_stations)
    @inter_stations.delete(inter_stations){'Станция не найдена'}
  end

  def stations
    @stations = [@from, *@inter_stations, @to]
    @stations
  end

# Может выводить список всех станций по-порядку от начальной до конечной
  def print_all_station
    @stations.each { |station| puts station.name_station }
  end
end
