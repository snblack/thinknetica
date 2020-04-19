require "./train_class.rb"

class Station < Train

  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name_station = name
  end

  # Может принимать поезда (по одному за раз)
  def take_train(obj_train)
      @list_train = {}
      @list_train[obj_train.num] = obj_train.type
  end

  # Может возвращать список всех поездов на станции, находящиеся в
  # текущий момент
  def list_train
    puts @list_train.keys
  end

  # Может возвращать список поездов на станции по типу
  # кол-во грузовых, пассажирских
  def list_train_by_type
    puts "Грузовых поездов: #{@list_train.select{ |num, type| type == 'Грузовой'}.count}"
    puts "Пассажирских поездов: #{@list_train.select{ |num, type| type == 'Пассажирский'}.count}"
  end

  # Может отправлять поезда (по одному за раз, при этом,
  # поезд удаляется из списка поездов, находящихся на станции).
  def send(train)
    train.moving('forward')
    @list_train.delete(train.num)
  end
end
