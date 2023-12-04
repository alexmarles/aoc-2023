require_relative 'day04'
require 'test/unit'

class Testday04A < Test::Unit::TestCase
  def test_example_day04_A
    result = day04A 'day04/exampleData.txt'
    assert_equal 13, result
  end

  def test_puzzle_day04_A
    result = day04A 'day04/inputData.txt'
    assert_equal 25_651, result
  end

  # def test_example_day04_B
  #   result = day04B 'day04/exampleData.txt'
  #   assert_equal 467_835, result
  # end

  # def test_puzzle_day04_B
  #   result = day04B 'day04/inputData.txt'
  #   assert_equal 81_939_900, result
  # end
end
