require 'minitest/autorun'
require 'minitest/rg'

require_relative '../person'

class TestPerson < MiniTest::Test

  def setup
    @passenger1 = Person.new("Alice", 32)
    @passenger2 = Person.new("Bob", 45)
  end

  def test_person_has_name
    expected = "Alice"
    actual = @passenger1.name
    assert_equal(expected, actual)
  end


end
