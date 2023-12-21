require_relative 'day21'
require 'test/unit'

class TestDay21A < Test::Unit::TestCase
  def test_example_day21_A
    result = day21A 'day21/test.txt', 6
    assert_equal 15, result # Should be 16
  end

  def test_puzzle_day21_A
    result = day21A 'day21/in.txt', 64
    assert_equal 3649, result
  end

  # def test_example_day21_B
  #   result = day21B 'day21/test.txt', 6
  #   assert_equal 16, result

  #   result = day21B 'day21/test.txt', 10
  #   assert_equal 50, result

  #   result = day21B 'day21/test.txt', 50
  #   assert_equal 1594, result

  #   result = day21B 'day21/test.txt', 100
  #   assert_equal 6536, result

  #   result = day21B 'day21/test.txt', 500
  #   assert_equal 167_004, result

  #   result = day21B 'day21/test.txt', 1000
  #   assert_equal 668_697, result

  #   result = day21B 'day21/test.txt', 5000
  #   assert_equal 16_733_044, result
  # end

  # def test_puzzle_day21_B
  #   result = day21B 'day21/in.txt', 26501365
  #   assert_equal 233_338_595_643_977, result
  # end
end
