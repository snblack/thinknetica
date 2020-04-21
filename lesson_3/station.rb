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


  # Может возвращать список поездов на станции по типу
  # кол-во грузовых, пассажирских
  def list_trains_by_type
    puts "Грузовых поездов: #{@list_trains.select{ |train| train.type == 'Грузовой'}.count}"
    puts "Пассажирских поездов: #{@list_trains.select{ |train| train.type == 'Пассажирский'}.count}"
  end

  # Может отправлять поезда (по одному за раз, при этом,
  # поезд удаляется из списка поездов, находящихся на станции).
  def send(train)
    @list_trains.delete(train)
  end

end
