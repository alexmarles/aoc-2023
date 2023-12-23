require_relative 'day23'
require 'test/unit'

class TestDay23A < Test::Unit::TestCase
  def test_example_day23_A
    result = day23A 'day23/test.txt'
    assert_equal 94, result
  end

  def test_puzzle_day23_A
    result = day23A 'day23/in.txt'
    assert_equal 2206, result
  end

  def test_example_day23_B
    result = day23B 'day23/test.txt'
    assert_equal 154, result
  end

  def test_puzzle_day23_B
    result = day23B 'day23/in.txt'
    assert_equal 6490, result
  end
end
