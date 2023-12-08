require_relative 'day08'
require 'test/unit'

class Testday08A < Test::Unit::TestCase
  def test_example_day08_A
    result = day08A 'day08/test.txt'
    assert_equal 2, result
    result = day08A 'day08/test2.txt'
    assert_equal 6, result
  end

  def test_puzzle_day08_A
    result = day08A 'day08/in.txt'
    assert_equal 21_389, result
  end

  def test_example_day08_B
    result = day08B 'day08/test3.txt'
    assert_equal 6, result
  end

  def test_puzzle_day08_B
    result = day08B 'day08/in.txt'
    assert_equal 21_083_806_112_641, result
  end
end
