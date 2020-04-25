require "./Train.rb"

class PassengerTrain < Train
  
  def add_wagon(wagon)
    super
    if wagon.class == PassengerWagon
      @wagons << wagon
    else
      puts 'Вагон не подходит к грузовому поезду'
    end
  end

  def del_wagon(wagon)
    super
    if @wagons.include(wagon)
      @wagons.delete(wagon)
    else
      puts 'Такого нет вагона у этого поезда'
    end
  end

end
