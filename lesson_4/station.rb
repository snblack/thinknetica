require "./train.rb"

class Station < Train

attr_reader :list_trains, :name_station

  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name_station = name
  end

  # Может принимать поезда (по одному за раз)
  def take_train(obj_train)
    @list_trains = []
    @list_trains << obj_train
  end

  # Может отправлять поезда (по одному за раз, при этом,
  # поезд удаляется из списка поездов, находящихся на станции).
  def send(train)
    @list_trains.delete(train)
  end

  def list_trains_by_type
    puts "Грузовых поездов: #{@list_trains.select{ |train| train.class == CargoTrain}.count}"
    puts "Пассажирских поездов: #{@list_trains.select{ |train| train.class == PassengerTrain}.count}"
  end

  def self.search_by_name(name)
    if Station.hash.values.include?(name)
      station = Station.hash.select { |station, name_station| name_station == name }
      station.keys[0]
    else
        puts "Сразу создайте такую станцию"
        abort
    end
  end

  private
  #используется только внутри класса

  def self.hash
    stations = ObjectSpace.each_object(Station).to_a
    hash = {}
    stations.each { |station| hash[station] = station.name_station }
    hash
  end

end
