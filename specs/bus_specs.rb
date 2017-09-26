require 'minitest/autorun'
require 'minitest/rg'

require_relative '../bus'
require_relative '../person'
require_relative '../stop'

class TestBus < MiniTest::Test

  def setup ()
    @passenger1 = Person.new("Alice", 32)
    @passenger2 = Person.new("Bob", 45)
    @stop1 = Stop.new("town", [])
    @stop2 = Stop.new("hospital", [])
    @five = Bus.new(5, "edinburgh")
    @ten = Bus.new(10, "dundee")
  end

  def test_bus_has_route
    actual = @five.route
    expected = 5
    assert_equal(actual, expected)
  end

  def test_bus_can_drive
    actual = @five.drive
    expected = "brum brum"
    assert_equal(actual, expected)
  end

  def test_number_of_passengers
    expected = []
    actual = @five.number_of_passengers
    assert_equal(expected, actual)
  end

  def test_pick_up()
    @five.pick_up(@passenger1)
    actual = @five.number_of_passengers.length
    assert_equal(1, actual)
  end

  def test_drop_off()
    @five.pick_up(@passenger1)
    @five.drop_off(@passenger1)
    actual = @five.number_of_passengers.length
    assert_equal(0, actual)
  end

  def test_drop_off__not_found()
    @five.pick_up(@passenger1)
    @five.drop_off(@passenger2)
    actual = @five.number_of_passengers.length
    assert_equal(1, actual)
  end

  def test_empty()
    @five.pick_up(@passenger1)
    @five.pick_up(@passenger2)
    @five.empty
    actual = @five.number_of_passengers.length
    assert_equal(0, actual)
  end

  def test_pick_up_from_stop()
    @stop1.add_person_to_queue(@passenger1)
    @stop1.add_person_to_queue(@passenger2)
    @five.pick_up_from_stop(@stop1)

    assert_equal(2, @five.number_of_passengers.length)
    assert_equal(0, @stop1.queue.length)
  end

end
