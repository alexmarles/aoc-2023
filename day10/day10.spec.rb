require_relative 'day10'
require 'test/unit'

class Testday10A < Test::Unit::TestCase
  def test_example_day10_A
    result = day10A 'day10/test.txt'
    assert_equal 4, result
    result = day10A 'day10/test2.txt'
    assert_equal 8, result
  end

  def test_puzzle_day10_A
    result = day10A 'day10/in.txt'
    assert_equal 7030, result
  end

  def test_example_day10_B
    result = day10B 'day10/test3.txt'
    assert_equal 4, result
    result = day10B 'day10/test4.txt'
    assert_equal 8, result
    result = day10B 'day10/test5.txt'
    assert_equal 10, result
  end

  def test_puzzle_day10_B
    result = day10B 'day10/in.txt'
    assert_equal 285, result
  end
end
