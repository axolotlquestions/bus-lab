require 'minitest/autorun'
require 'minitest/rg'

require_relative '../stop'
require_relative '../person'

class TestStop < MiniTest::Test

  def setup
    @passenger1 = Person.new("Alice", 32)
    @passenger2 = Person.new("Bob", 45)
    @stop1 = Stop.new("town", [])
    @stop2 = Stop.new("hospital", [])
  end

  def test_queue
    expected = []
    actual = @stop1.queue
    assert_equal(expected, actual)
  end

  def test_add_person_to_queue
    @stop1.add_person_to_queue(@passenger1)
    assert_equal(1, @stop1.queue.length)
  end

end
