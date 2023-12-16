require_relative 'day16'
require 'test/unit'

class Testday16A < Test::Unit::TestCase
  def test_example_day16_A
    result = day16A 'day16/test.txt'
    assert_equal 46, result
  end

  def test_puzzle_day16_A
    result = day16A 'day16/in.txt'
    assert_equal 7870, result
  end

  def test_example_day16_B
    result = day16B 'day16/test.txt'
    assert_equal 51, result
  end

  def test_puzzle_day16_B
    result = day16B 'day16/in.txt'
    assert_equal 8143, result
  end
end
