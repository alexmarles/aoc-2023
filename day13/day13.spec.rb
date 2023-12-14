require_relative 'day13'
require 'test/unit'

class Testday13A < Test::Unit::TestCase
  def test_example_day13_A
    result = day13A 'day13/test.txt'
    assert_equal 405, result
  end

  def test_puzzle_day13_A
    result = day13A 'day13/in.txt'
    assert_equal 39_939, result
  end

  def test_example_day13_B
    result = day13B 'day13/test.txt'
    assert_equal 400, result
  end

  def test_puzzle_day13_B
    result = day13B 'day13/in.txt'
    assert_equal 32_069, result
  end
end
