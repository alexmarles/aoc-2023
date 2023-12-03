require_relative 'day03'
require 'test/unit'

class Testday03A < Test::Unit::TestCase
  def test_example_day03_A
    result = day03A 'day03/exampleData.txt'
    assert_equal 4361, result
  end

  def test_puzzle_day03_A
    result = day03A 'day03/inputData.txt'
    assert_equal 537_832, result
  end

  # def test_example_day03_B
  #   result = day03B 'day03/exampleData.txt'
  #   assert_equal 2286, result
  # end

  # def test_puzzle_day03_B
  #   result = day03B 'day03/inputData.txt'
  #   assert_equal 72_422, result
  # end
end
