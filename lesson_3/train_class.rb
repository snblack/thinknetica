require "./route_class.rb"

class Train < Route
  # Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и
  # количество вагонов, эти данные указываются при создании экземпляра класса
  attr_reader :num, :type

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

  # Может возвращать текущую скорость
  def current_speed
    puts @speed
  end

  # Может тормозить (сбрасывать скорость до нуля)
  def to_brake
    @speed = 0
  end

  # Может возвращать количество вагонов
  def wagons
    puts @wagons
  end

  # Может прицеплять/отцеплять вагоны (по одному вагону за операцию,
  # метод просто увеличивает или уменьшает количество вагонов).
  # Прицепка/отцепка вагонов может осуществляться только если поезд
  # не движется.

  def change_wagons(value)
    if @speed == 0
      @wagons += 1 if value == 'add'
      @wagons -= 1 if value == 'del'
    else
      puts 'Поезд находится в движении'
    end
  end

  # Может принимать маршрут следования (объект класса Route)
  # При назначении маршрута поезду, поезд автоматически помещается
  # на первую станцию в маршруте.

  def route_train(route_obj)
    @route_train = route_obj.route
    @num_station = 0
    @current_station = @route_train[@num_station]
  end

  # Может перемещаться между станциями, указанными в маршруте.
  # Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def moving(direct)
    @num_station += 1 if direct == 'forward'
    @num_station -= 1 if direct == 'backward'
    @current_station = @route_train[@num_station]
    @prev_station = @route_train[@num_station-1]
    @next_station = @route_train[@num_station+1]
  end

  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def print_current_status
    puts "Предыдущая станция: #{@prev_station}"
    puts "Текущая станция: #{@current_station}"
    puts "Следующая станция: #{@next_station}"
  end
end
