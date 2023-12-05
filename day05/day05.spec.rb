require_relative 'day05'
require 'test/unit'

class Testday05A < Test::Unit::TestCase
  def test_example_day05_A
    result = day05A 'day05/exampleData.txt'
    assert_equal 35, result
  end

  def test_puzzle_day05_A
    result = day05A 'day05/inputData.txt'
    assert_equal 662_197_086, result
  end

  def test_example_day05_B
    result = day05B 'day05/exampleData.txt'
    assert_equal 46, result
  end

  def test_puzzle_day05_B
    result = day05B 'day05/inputData.txt'
    assert_equal 52_510_809, result
  end
end
