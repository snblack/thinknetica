require "./train.rb"

class PassengerTrain < Train
  attr_reader :type

  def initialize(num)
    super

    @type = 'passenger'
  end
end
