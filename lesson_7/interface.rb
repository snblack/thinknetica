class Interface
  attr_reader :select

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def seed
    #seed
    station1 = Station.new('Moscow')
    station2 = Station.new('Smolensk')
    station3 = Station.new('Minsk')

    route1 = Route.new(station1, station3, '002')
    route1.add_station(station2)

    train1 = PassengerTrain.new('111-АА')
    train1.take_route(route1)

    train1.add_wagon(WagonPassenger.new(50))
    train1.add_wagon(WagonPassenger.new(100))
    #seed
  end

  def start
    loop do

      puts 'Привет. С чем хочешь поработать?'

      puts '1. Станции'
      puts '2. Поезда'
      puts '3. Маршруты'
      puts '4. Выйти из программы'


      @select = gets.chomp.to_i
      puts "\n"



      break if @select == 4

      case @select
      when 1
        work_with_stations

        if @select == 1
          create_station

        elsif @select == 2
          list_trains_on_station
        end

      when 2
        work_with_trains

        if @select == 1
          create_train

        elsif @select == 2
          train_take_route

        elsif @select == 3
          add_wagon

        elsif @select == 4
          del_wagon

        elsif @select == 5
          moving_forward

        elsif @select == 6
          moving_backward

        elsif @select == 7
          list_wagons

        elsif @select == 8
          take_space

        end

      when 3
        work_with_routes

        if @select == 1
          create_route
        elsif @select == 2
          add_station_to_route
        elsif @select == 3
          del_station_from_route
        elsif @select == 4
          list_station_in_route
        end
      end
    end
  end

  private

  def work_with_stations
    puts '1. Создать станцию'
    puts '2. Посмотреть список поездов на станции'
    @select = gets.chomp.to_i
    puts "\n"
  end

  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    @stations << Station.new(name)
    puts "Станция #{@stations.last.name_station} успешно создана"
  end

  def list_trains_on_station
    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)
    # puts station.list_trains
    station.block do |train|
      puts "Номер поезда: #{train.num}"
      puts "Тип поезда: #{train.type}"
      puts "Кол-во вагонов: #{train.wagons.count}"
      puts '------------'
    end
  end

  def work_with_trains
    puts '1. Создать поезд'
    puts '2. Назначить маршрут поезду'
    puts '3. Добавить вагоны к поезду'
    puts '4. Отцепить вагоны от поезда'
    puts '5. Переместить поезд по маршруту вперед'
    puts '6. Переместить поезд по маршруту назад'
    puts '7. Посмотреть список вагонов у поезда'
    puts '8. Занять место/объем в вагоне поезда'

    @select = gets.chomp.to_i
    puts "\n"
  end

  def create_train
    puts 'Выберите тип поезда'
    puts '1. Пассажирский'
    puts '2. Грузовой'
    type_train = gets.chomp.to_i
    puts 'Какой будет у поезда номер?'
    num_train = gets.chomp

    if type_train == 1
      @trains << PassengerTrain.new(num_train)
    elsif type_train == 2
      @trains << CargoTrain.new(num_train)
    end
    puts "Поезд с номером #{num_train} успешно создан"
  end

  def train_take_route
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    train.take_route(route)
  end

  def add_wagon
    puts 'Введите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    if train.type == 'passenger'
      puts 'Кол-во мест в вагоне?'
      seats = gets.chomp.to_i
      train.add_wagon(WagonPassenger.new(seats))
    elsif train.type == 'cargo'
      puts 'Объем вместимости вагона?'
      volume = gets.chomp.to_i
      train.add_wagon(WagonCargo.new(volume))
    end


  end

  def del_wagon
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    if train.wagons != 0
      train.del_wagon(train.wagons.last)
    else
      puts 'У поезда нет вагонов'
    end
  end

  def moving_forward
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    train.moving_forward
  end

  def moving_backward
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    train.moving_backward
  end

  def list_wagons
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    train.block do |wagon|
      puts "Номер вагона: #{wagon.num_wagon}"
      puts "Тип вагона: #{wagon.type}"
      if wagon.type == 'passenger'
        puts "Кол-во свободных мест: #{wagon.free_seats}"
        puts "Кол-во занятых мест: #{wagon.booked_seats}"
        puts '-----------------'
      elsif wagon.type == 'cargo'
        puts "Кол-во свободного объема: #{wagon.free_volume}"
        puts "Кол-во занятого объема: #{wagon.booked_volume}"
        puts '-----------------'
      end
    end
  end

  def take_space
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    puts 'Введите номер вагона'
    num = gets.chomp.to_i
    wagon = train.wagons.find {|wagon| wagon.num_wagon == num}

    if train.type == 'passenger'
      wagon.take_seat
    elsif train.type == 'cargo'
      wagon.take_volume
    end
  end

  def work_with_routes
    puts '1. Создать маршрут'
    puts '2. Добавить станцию к маршруту'
    puts '3. Удалить станцию из маршруту'
    puts '4. Посмотреть список станций у маршрута'
    @select = gets.chomp.to_i
  end

  def create_route
    puts 'Введите название начальной станции'
    name = gets.chomp
    from = Station.search_by_name(name)

    puts 'Введите название конечной станции'
    name = gets.chomp
    to = Station.search_by_name(name)

    puts 'Введите номер маршрута'
    num = gets.chomp

    @routes << Route.new(from, to, num)
    puts "Маршрут от #{from.name_station} до #{to.name_station} успешно создан"
  end

  def add_station_to_route
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)

    route.add_station(station)
  end

  def del_station_from_route
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)

    route.delete_station(station)
  end

  def list_station_in_route
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    print_all_station(route)
  end
  def print_all_station(route)
    route.stations.each { |station| puts station.name_station }
  end
end
