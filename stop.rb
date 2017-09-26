class Stop


  def initialize(name, queue)
    @name = name
    @queue = queue
  end

  def queue
    return @queue
  end

  def add_person_to_queue(passenger)
    @queue.push(passenger)
  end




end
