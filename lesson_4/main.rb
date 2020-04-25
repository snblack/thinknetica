require "./Station.rb"
require "./Train.rb"
require "./Route.rb"
require "./CargoTrain.rb"
require "./CargoWagon.rb"
require "./PassengerWagon.rb"
require "./PassengerTrain.rb"

stations = []
routes = []
trains = []

loop do

puts 'Привет. С чем хочешь поработать?'

puts '1. Станции'
puts '2. Поезда'
puts '3. Маршруты'
puts '4. Выйти из программы'


select = gets.chomp.to_i
puts "\n"
break if select == 4

if select == 1
  puts '1. Создать станцию'
  puts '2. Посмотреть список поездов на станции'
  select = gets.chomp.to_i
  puts "\n"

  if select == 1
    puts 'Введите название станции'
    name = gets.chomp
    stations << Station.new(name)
    puts "Станция #{stations.last.name_station} успешно создана"

  elsif select == 2
    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)
    puts station.list_trains
  end

elsif select == 2
  puts '1. Создать поезд'
  puts '2. Назначить маршрут поезду'
  puts '3. Добавить вагоны к поезду'
  puts '4. Отцепить вагоны от поезда'
  puts '5. Переместить поезд по маршруту вперед'
  puts '6. Переместить поезд по маршруту назад'

  select = gets.chomp.to_i
  puts "\n"

  # 1. Создать поезд
  if select == 1
    puts 'Выберите тип поезда'
    puts '1. Пассажирский'
    puts '2. Грузовой'
    type_train = gets.chomp.to_i
    puts 'Какой будет у поезда номер?'
    num_train = gets.chomp

    if type_train == 1
      trains << PassengerTrain.new(num_train)
    elsif type_train == 2
      trains << CargoTrain.new(num_train)
    end
    puts "Поезд с номером #{num_train} успешно создан"
  end

  # 2. Назначить маршрут поезду
  if select == 2
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    train.take_route(route)
  end

  # 3. Добавить вагоны к поезду
  if select == 3
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    if train.class == CargoTrain
      train.add_wagon(CargoWagon.new)
    elsif train.class == PassengerTrain
      train.add_wagon(PassengerWagon.new)
    end
  end

  # 4. Отцепить вагоны от поезда
  if select == 4
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    if train.wagons != 0
      train.del_wagon(train.wagons.last)
    else
      puts 'У поезда нет вагонов'
    end
  end

  # 5. Переместить поезд по маршруту вперед
  if select == 5
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    train.moving_forward
  end

  # 6. Переместить поезд по маршруту назад
  if select == 6
    puts 'Ввведите номер поезда'
    num_train = gets.chomp
    train = Train.search_by_num(num_train)

    train.moving_backward
  end

elsif select == 3
  puts '1. Создать маршрут'
  puts '2. Добавить станцию к маршруту'
  puts '3. Удалить станцию из маршруту'
  puts '4. Посмотреть список станций у маршрута'
  select = gets.chomp.to_i

  # 1. Создать маршрут
  if select == 1
    puts 'Введите название начальной станции'
    name = gets.chomp
    from = Station.search_by_name(name)

    puts 'Введите название конечной станции'
    name = gets.chomp
    to = Station.search_by_name(name)

    puts 'Введите номер маршрута'
    num = gets.chomp

    routes << Route.new(from, to, num)
    puts "Маршрут от #{from.name_station} до #{to.name_station} успешно создан"
  end

  # 2. Добавить станцию к маршруту
  if select == 2
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)

    route.add_station(station)
  end

  # 3. Удалить станцию из маршруту
  if select == 3
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    puts 'Ввведите название станции'
    name = gets.chomp
    station = Station.search_by_name(name)

    route.delete_station(station)
  end

  # 4. Посмотреть список станций у маршрута
  if select == 4
    puts 'Ввведите номер маршрута'
    num_route = gets.chomp
    route = Route.search_by_num(num_route)

    route.print_all_station
  end
end
end
