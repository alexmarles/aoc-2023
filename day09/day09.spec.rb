require_relative 'day09'
require 'test/unit'

class Testday09A < Test::Unit::TestCase
  def test_example_day09_A
    result = day09A 'day09/test.txt'
    assert_equal 114, result
  end

  def test_puzzle_day09_A
    result = day09A 'day09/in.txt'
    assert_equal 1_882_395_907, result
  end

  def test_example_day09_B
    result = day09B 'day09/test.txt'
    assert_equal 2, result
  end

  def test_puzzle_day09_B
    result = day09B 'day09/in.txt'
    assert_equal 1005, result
  end
end
