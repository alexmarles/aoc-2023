require_relative 'day01'
require 'test/unit'

class TestDay01A < Test::Unit::TestCase
  def test_example_day01_A
    result = day01A 'day01/exampleData.txt'
    assert_equal result, 142
  end

  def test_puzzle_day01_A
    result = day01A 'day01/inputData.txt'
    assert_equal result, 53_334
  end

  def test_example_day01_B
    result = day01B 'day01/exampleData2.txt'
    assert_equal result, 281
  end

  def test_puzzle_day01_B
    result = day01B 'day01/inputData.txt'
    assert_equal result, 52_834
  end
end
