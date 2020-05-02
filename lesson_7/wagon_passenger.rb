require "./wagon.rb"

class WagonPassenger < Wagon
  attr_accessor :num_wagon
  attr_reader :type, :seats, :booked_seats, :free_seats

  def initialize(seats)
    @seats = seats
    @booked_seats = 0
    @type = 'passenger'
    @free_seats = @seats
    @num_wagon = ''
  end

  def take_seat
    @booked_seats += 1
    @free_seats = @seats - @booked_seats
  end

end
