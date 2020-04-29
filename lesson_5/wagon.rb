require "./name_manufacturer.rb"

class Wagon
  attr_reader :type

  def initialize(type)
    @type = type
  end

  include NameManufacturer
end
