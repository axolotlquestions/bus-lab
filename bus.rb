class Bus

  def initialize(route, destination)
    @route = route
    @destination = destination
    @passengers = []
  end

  def route()
    return @route
  end

  def drive()
    return "brum brum"
  end

  def number_of_passengers()
    return @passengers
  end

  def pick_up(passenger)
    @passengers.push(passenger)
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty
    @passengers.clear
  end

  def pick_up_from_stop(stop)
    @passengers.concat(stop.queue)
    (stop.queue).clear
  end
end
