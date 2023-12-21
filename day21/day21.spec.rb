require_relative 'day21'
require 'test/unit'

class TestDay21A < Test::Unit::TestCase
  # def test_example_day21_A
  #   result = day21A 'day21/test.txt', 6
  #   assert_equal 16, result
  # end

  def test_puzzle_day21_A
    result = day21A 'day21/in.txt', 64
    assert_equal 3649, result
  end

  # def test_example_day21_B
  #   result = day21B 'day21/test.txt'
  #   assert_equal 233_338_595_643_977, result
  # end

  # def test_puzzle_day21_B
  #   result = day21B 'day21/in.txt'
  #   assert_equal 233_338_595_643_977, result
  # end
end
