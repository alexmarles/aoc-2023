require_relative 'day06'
require 'test/unit'

class Testday06A < Test::Unit::TestCase
  def test_example_day06_A
    result = day06A 'day06/exampleData.txt'
    assert_equal 288, result
  end

  def test_puzzle_day06_A
    result = day06A 'day06/inputData.txt'
    assert_equal 6_209_190, result
  end

  def test_example_day06_B
    result = day06B 'day06/exampleData.txt'
    assert_equal 71_503, result
  end

  def test_puzzle_day06_B
    result = day06B 'day06/inputData.txt'
    assert_equal 28_545_089, result
  end
end
