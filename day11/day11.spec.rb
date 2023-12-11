require_relative 'day11'
require 'test/unit'

class Testday11A < Test::Unit::TestCase
  def test_example_day11_A
    result = day11A 'day11/test.txt'
    assert_equal 374, result
  end

  def test_puzzle_day11_A
    result = day11A 'day11/in.txt'
    assert_equal 9_370_588, result
  end

  # def test_example_day11_B
  #   result = day11B 'day11/test.txt'
  #   assert_equal 2, result
  # end

  # def test_puzzle_day11_B
  #   result = day11B 'day11/in.txt'
  #   assert_equal 1005, result
  # end
end
