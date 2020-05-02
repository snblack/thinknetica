require "./train.rb"

class CargoTrain < Train
  attr_reader :type

  create_variable_instances

  def initialize(num)
    super

    @type = 'cargo'
  end
end
