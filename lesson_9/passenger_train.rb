# frozen_string_literal: true

require './train.rb'

class PassengerTrain < Train
  attr_reader :type

  create_variable_instances

  def initialize(num)
    super

    @type = 'passenger'
  end
end
