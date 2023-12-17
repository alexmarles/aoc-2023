require_relative 'day15'
require 'test/unit'

class Testday15A < Test::Unit::TestCase
  def test_example_day15_A
    result = day15A 'day15/test.txt'
    assert_equal 1320, result
  end

  def test_puzzle_day15_A
    result = day15A 'day15/in.txt'
    assert_equal 516_804, result
  end

  # def test_example_day15_B
  #   result = day15B 'day15/test.txt'
  #   assert_equal 145, result
  # end

  # def test_puzzle_day15_B
  #   result = day15B 'day15/in.txt'
  #   assert_equal 90_982, result
  # end
end
