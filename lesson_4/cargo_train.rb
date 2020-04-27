require "./train.rb"

class CargoTrain < Train
  attr_reader :type

  def initialize(num)
    super

    @type = 'cargo'
  end
end
