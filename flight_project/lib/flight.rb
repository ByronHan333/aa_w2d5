class Flight
  attr_reader :passengers

  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  def full?
    @capacity == @passengers.length
  end

  def board_passenger(passenger)
    if passenger.has_flight?(@flight_number) && !full?
      @passengers << passenger
    else
      puts "cannot add, full or wrong flight number"
    end
  end

  def list_passengers
    @passengers.map{|p| p.name}
  end

  def [](idx)
    @passengers[idx]
  end

  def <<(passenger)
    board_passenger(passenger)
  end
end
