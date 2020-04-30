require "./name_manufacturer.rb"

class Wagon
  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  include NameManufacturer

  protected

  def validate!
    raise 'Такого типа вагона не существет. Либо passenger либо cargo' if type != 'cargo' and type != 'passenger'
  end
end
