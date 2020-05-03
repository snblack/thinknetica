# frozen_string_literal: true

require './wagon.rb'

class WagonCargo < Wagon
  attr_accessor :num_wagon
  attr_reader :type, :volume, :booked_volume, :free_volume

  def initialize(volume)
    @volume = volume
    @booked_volume = 0
    @type = 'cargo'
    @num_wagon = ''
  end

  def take_volume(vol)
    @booked_volume += vol
    @free_volume = @volume - @booked_volume
  end
end
